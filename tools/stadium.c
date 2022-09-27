#define PROGRAM_NAME "stadium"
#define USAGE_OPTS "pokegold.gbc"

#include "common.h"

// A matching ROM has 128 banks
#define NUMBANKS 128
// ROM banks are $4000 bytes
#define BANKSIZE 0x4000
// A matching ROM is $200000 bytes
#define ROMSIZE (NUMBANKS * BANKSIZE)

// ASCII "N64PS3" header
#define N64PS3SIZE 6
uint8_t n64ps3[N64PS3SIZE] = {'N', '6', '4', 'P', 'S', '3'};

// "N64PS3" + 2-byte CRC
#define HEADERSIZE (N64PS3SIZE + 2)
// header + 2-byte half-bank checksums
#define DATASIZE (HEADERSIZE + NUMBANKS * 2 * 2)

// The Game Boy cartridge header stores a global checksum at 0x014E-0x014F
#define GLOBALOFF 0x014E
// The Stadium data is stored at the end of the ROM
#define DATAOFF (ROMSIZE - DATASIZE)

// The CRC polynomial value
#define CRC_POLY 0xC387
// The CRC initial value (also used for checksums)
#define CRC_INIT 0xFEFE

#define SET_U16BE(file, off, v) do { \
	file[(off) + 0] = (uint8_t)(((v) & 0xFF00) >> 8); \
	file[(off) + 1] = (uint8_t)(((v) & 0x00FF) >> 0); \
} while (0)

uint16_t calculate_checksum(uint16_t checksum, uint8_t *file, int start, int size) {
	for (int j = start; j < start + size; j++) {
		checksum += file[j];
	}
	return checksum;
}

void calculate_checksums(uint8_t *file) {
	// Initialize the CRC table
	uint16_t crc_table[256];
	for (int i = 0; i < 256; i++) {
		uint16_t c = i;
		uint16_t rem = 0;
		for (int y = 0; y < 8; y++) {
			rem = (rem >> 1) ^ ((rem ^ c) & 1 ? CRC_POLY : 0);
			c >>= 1;
		}
		crc_table[i] = rem;
	}

	// Clear the global checksum
	SET_U16BE(file, GLOBALOFF, 0);

	// Initialize the Stadium data (this should be free space anyway)
	memset(file + DATAOFF, 0, DATASIZE);
	memcpy(file + DATAOFF, n64ps3, N64PS3SIZE);

	// Calculate the half-bank checksums
	for (int i = 0; i < NUMBANKS * 2; i++) {
		uint16_t checksum = calculate_checksum(CRC_INIT, file, i * BANKSIZE / 2, BANKSIZE / 2);
		SET_U16BE(file, DATAOFF + HEADERSIZE + i * 2, checksum);
	}

	// Calculate the CRC of the half-bank checksums
	uint16_t crc = CRC_INIT;
	for (int i = DATAOFF + HEADERSIZE; i < DATAOFF + DATASIZE; i++) {
		crc = (crc >> 8) ^ crc_table[(crc & 0xFF) ^ file[i]];
	}
	SET_U16BE(file, DATAOFF + HEADERSIZE - 2, crc);

	// Calculate the global checksum
	uint16_t globalsum = calculate_checksum(0, file, 0, ROMSIZE);
	SET_U16BE(file, GLOBALOFF, globalsum);
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		usage_exit(1);
	}

	char *filename = argv[1];
	long filesize;
	uint8_t *file = read_u8(filename, &filesize);
	if (filesize == ROMSIZE) {
		calculate_checksums(file);
	}
	write_u8(filename, file, filesize);
	return 0;
}
