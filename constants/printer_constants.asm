; wPrinterStatus
	const_def 1
	const PRINTER_STATUS_CHECKING
	const PRINTER_STATUS_TRANSMITTING
	const PRINTER_STATUS_PRINTING
	const PRINTER_ERROR_1
	const PRINTER_ERROR_2
	const PRINTER_ERROR_3
	const PRINTER_ERROR_4

; wPrinterStatusFlags
	const_def 5
	shift_const PRINTER_STATUS_ERROR_3
	shift_const PRINTER_STATUS_ERROR_4
	shift_const PRINTER_STATUS_ERROR_1

; wPrinterConnectionOpen
	const_def
	const PRINTER_CONNECTION_OPEN
	const PRINTER_CONNECTION_SUCCESS
