#define PROGRAM_NAME "stadium"
#define USAGE_OPTS "pokegold.gbc"

#include "common.h"

// The Game Boy cartridge header stores a global checksum at 0x014E-0x014F
#define GLOBALOFF 0x014E
// ASCII "N64PS3" header
#define N64PS3SIZE 6
// N64PS3 + CRC
#define HEADERSIZE (N64PS3SIZE + 2)
// Checksum every half-bank
#define CHECKSIZE 0x2000
// The CRC polynomial value
#define CRC_POLY 0xC387
// The CRC initial value (also used for checksums)
#define CRC_INIT 0xFEFE

uint8_t n64ps3[N64PS3SIZE] = {'N', '6', '4', 'P', 'S', '3'};

#define SET_U16BE(file, off, v) do { \
	file[(off) + 0] = (uint8_t)(((v) & 0xFF00) >> 8); \
	file[(off) + 1] = (uint8_t)(((v) & 0x00FF) >> 0); \
} while (0)

void calculate_checksums(uint8_t *file, int filesize) {
	int NUMCHECKS = filesize / CHECKSIZE;
	int DATASIZE = HEADERSIZE + NUMCHECKS * 2; // 2 bytes per checksum
	int ORIGIN = filesize - DATASIZE; // Stadium data goes at the end of the file

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
	memset(file + ORIGIN, 0, DATASIZE);
	memcpy(file + ORIGIN, n64ps3, N64PS3SIZE);

	// Calculate the half-bank checksums
	for (int i = 0; i < NUMCHECKS; i++) {
		uint16_t checksum = CRC_INIT;
		for (int j = 0; j < CHECKSIZE; j++) {
			checksum += file[i * CHECKSIZE + j];
		}
		SET_U16BE(file, ORIGIN + HEADERSIZE + i * 2, checksum);
	}

	// Calculate the CRC of the half-bank checksums
	uint16_t crc = CRC_INIT;
	for (int i = ORIGIN + HEADERSIZE; i < ORIGIN + DATASIZE; i++) {
		crc = (crc >> 8) ^ crc_table[(crc & 0xFF) ^ file[i]];
	}
	SET_U16BE(file, ORIGIN + HEADERSIZE - 2, crc);

	// Calculate the global checksum
	uint16_t globalsum = 0;
	for (int i = 0; i < filesize; i++) {
		globalsum += file[i];
	}
	SET_U16BE(file, GLOBALOFF, globalsum);
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		usage_exit(1);
	}

	char *filename = argv[1];
	long filesize;
	uint8_t *file = read_u8(filename, &filesize);
	calculate_checksums(file, filesize);
	write_u8(filename, file, filesize);
	return 0;
}
