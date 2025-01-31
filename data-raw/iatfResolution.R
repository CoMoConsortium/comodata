library(rvest)
library(pdftools)
library(stringr)

## Resolutions table ###########################################################

iatfLinks <- get_iatf_links()

usethis::use_data(iatfLinks, overwrite = TRUE, compress = "xz")

## Resolution 9 ################################################################

## Read resolution
x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-9.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

## Clean-up

y <- y[3:length(y)]
y <- y[c(1:44, 56:length(y))]

y[67] <- "FRANCISCO T. DUQUE III"
y[68] <- "Secretary, Department of Health"
y[69] <- ""
y[70] <- "EDUARDO M. AÑO"
y[71] <- "Secretary, Department of the Interior and Local Government"
y[72] <- ""
y[73] <- "BERNADETTE ROMULO-PUYAT"
y[74] <- "Secretary, Department of Tourism"
y[75] <- ""
y[76] <- "BRIGIDO J. DULAY"
y[77] <- "Undersecretary, Department of Foreign Affairs"

y <- y[c(1:78, 92:length(y))]

y[79] <- "MANUEL ANTONIO L. TAMAYO"
y[80] <- "Undersecretary, Department of Transportation"
y[81] <- ""
y[84] <- ""
y[85] <- "ALAN A. SILOR"
y[86] <- "Assistant Secretary, Department of Information and Communications Technology"
y[87] <- ""
y[88] <- "MA. TERESITA S. CUCUECO"
y[90] <- ""

y[29] <- stringr::str_replace(string = y[29], pattern = "\\[ATF", replacement = "IATF")

y <- y[11:90]

y <- y[y != ""]

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 9,
                date = as.Date("03/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution09 <- tibble::tibble(y)

usethis::use_data(iatfResolution09, overwrite = TRUE, compress = "xz")


## Resolution 10 ###############################################################

## Read resolution
x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-10.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[6:length(y)]
y[41] <- stringr::str_remove(string = y[41], pattern = " J")

y <- y[c(1:42, 47:length(y))]
y <- y[c(1:82, 86:length(y))]

y <- c(y[1:85], "", y[86:length(y)])

y[87] <- "FRANCISCO T. DUQUE III"

y[89] <- ""

y[90] <- "TEODORO L. LOCSIN, JR"
y[91] <- "Secretary, Department of Foreign Affairs"

y[92] <- ""

y[93] <- "EDUARDO M. AÑO"
y[94] <- "Secretary, Department of the Interior and Local Government"

y[95] <- ""

y[96] <- y[97]
y[97] <- y[98]

y[98] <- ""

y[99]  <- "BERNADETTE FATIMA T. ROMULO-PUYAT"
y[100] <- "Secretary, Department of Tourism"

y[101] <- ""

y[102] <- "ARTHUR P. TUGADE"
y[103] <- "Secretary, Department of Transportation"

y[104] <- ""

y[105] <- "SILVESTRE H. BELLO III"
y[106] <- "Secretary, Department of Labor and Employment"

y[107] <- ""

y[108] <- "ALAN A. SILOR"
y[109] <- "Assistant Secretary, Department of Information and Communications Technology"

y[80] <- stringr::str_replace(string = y[80], pattern = "Malacafiang", replacement = "Malacañang")

y <- y[c(11:41, 46:81, 87:length(y))]
y <- y[y != ""]

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 10,
                date = as.Date("09/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution10 <- tibble::tibble(y)

usethis::use_data(iatfResolution10, overwrite = TRUE, compress = "xz")


## Resolution 11 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-RESO-11.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(10:32, 41:66, 75:101, 110:138, 147:161, 170:177)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 11,
                date = as.Date("12/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution11 <- tibble::tibble(y)

usethis::use_data(iatfResolution11, overwrite = TRUE, compress = "xz")


## Resolution 12 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-12.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(8:45, 57:89, 103:127, 143:174, 191:227)]

y[132] <- stringr::str_remove(string = y[132], pattern = " |")
y[133] <- "Malacañang Palace, Manila."
y[134] <- ""
y[135] <- "FRANCISCO T. DUQUE"
y[136] <- "Secretary, Department of Health"
y[137] <- ""
y[138] <- "EDUARDO M. AÑO"
y[139] <- "Secretary, Department of the Interior and Local Government"
y[140] <- ""
y[141] <- "BERNADETTE ROMULO-PUYAT"

y <- y[c(1:144, 156:165)]

y[151] <- ""
y[152] <- "ALAN A. SILOR"
y[153] <- "Assistant Secretary, Department of Information and Communications Technology"

y <- y[c(11:13, 15, 17:22, 24:32, 34:42, 44:48, 50:51, 53:60, 62:99,
         101:107, 109:111, 113:118, 120:133, 135:136, 138:139, 141:150, 152:153)]

y[56] <- stringr::str_remove(string = y[56], pattern = " \\|")
y[75] <- stringr::str_remove(string = y[75], pattern = " \\|")
y[110] <- stringr::str_remove(string = y[110], pattern = " \\|")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 12,
                date = as.Date("13/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution12 <- tibble::tibble(y)

usethis::use_data(iatfResolution12, overwrite = TRUE, compress = "xz")


## Resolution 13 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-13.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(7:38, 46:59, 61:63, 65:81, 91:134, 143:175, 184:length(y))]

y[166] <- "FRANCISCO T DUQUE III"
y[167] <- "Secretary, Department of Health"
y[168] <- "EDUARDO M. AÑO"
y[169] <- "Secretary, Department of Interior and Local Government"
y[170] <- "BERNADETTE ROMULO-PUYAT"
y[171] <- "Secretary, Department of Tourism"
y[172] <- "SILVESTRE H. BELLO III"
y[173] <- "Secretary, Department of Labor and Employment"
y[174] <- "MENARDO I. GUEVARRA"
y[175] <- "Secretary, Department of Justice"
y[176] <- "BRIGIDO J. DULAY"
y[177] <- "Undersecretary, Department of Foreign Affairs"
y[178] <- "ARTEMIO U. TUAZON, JR."
y[179] <- "ALAN A. SILOR"
y[180] <- "Assistant Secretary, Department of Information and Communications Technology"
y[181] <- "With the concurrence of:"
y[182] <- "KARLO B. NOGRALES"
y[183] <- "Cabinet Secretary, Cabinet Secretariat of the Philippines"
y[184] <- "RAMON M. LOPEZ"
y[185] <- y[210]
y[186] <- "ROLANDO JOSELITO D. BAUTISTA"
y[187] <- y[213]
y[188] <- y[214]
y[189] <- y[215]
y[190:193] <- y[216:219]
y[194] <- "MARTIN M. ANDANAR"
y[195] <- "Secretary, Presidential Communications Operations Office"
y[196:197] <- y[222:223]
y[198] <- "RICARDO B. JALAD"
y[199] <- "Administrator, Office of the Civil Defense"
y[200:203] <- y[234:237]
y[204] <- "RONNIE GIL L. GAVAN"
y[205] <- "Acting Deputy Chief of Staff for Operations, Philippine Coast Guard"
y[206] <- "VICENTE M. AGDAMAG"
y[207] <- y[242]
y[208] <- "JESUS L. R. MATEO"
y[209] <- "Undersecretary, Department of Education"
y[210] <- "BAYANI H. AGABIN"
y[211] <- y[247]
y[212] <- y[249]
y[213] <- "Undersecretary, National Economic and Development Authority"
y[214] <- y[251]
y[215] <- "Assistant Secretary, Office of the Chief Presidential Legal Counsel"

y <- y[1:215]
y <- y[y != ""]

y[14] <- stringr::str_remove(string = y[14], pattern = ": ")
y[14] <- stringr::str_remove(string = y[14], pattern = ":")
y[15] <- stringr::str_remove(string = y[15], pattern = "z ")
y[16] <- stringr::str_remove(string = y[16], pattern = "3 ")
y[45] <- stringr::str_remove(string = y[45], pattern = ": ")
y[46] <- stringr::str_remove(string = y[46], pattern = "4 ")
y[46] <- stringr::str_remove(string = y[46], pattern = ":")
y[47] <- stringr::str_remove(string = y[47], pattern = "; ")
y[52] <- stringr::str_remove(string = y[52], pattern = "\\? ")
y[53] <- stringr::str_remove(string = y[53], pattern = "\\| ")
y[54] <- stringr::str_remove(string = y[54], pattern = "\\| ")
y[55] <- stringr::str_remove(string = y[55], pattern = "\\| ")
y[56] <- stringr::str_remove(string = y[56], pattern = "\\| ")
y[57] <- stringr::str_remove(string = y[57], pattern = "\\| ")
y[75] <- stringr::str_replace(string = y[75], pattern = "OF Ws", replacement = "OFWs")
y[83] <- stringr::str_remove(string = y[83], pattern = "Z ")
y[84] <- stringr::str_remove(string = y[84], pattern = "j ")
y[86] <- stringr::str_remove(string = y[86], pattern = "f ")
y[87] <- stringr::str_remove(string = y[87], pattern = "5 ")
y[88] <- stringr::str_remove(string = y[88], pattern = "4")
y[89] <- stringr::str_remove(string = y[89], pattern = "2 ")
y[90] <- stringr::str_remove(string = y[90], pattern = "5 ")
y[91] <- stringr::str_remove(string = y[91], pattern = "& ")
y[92] <- stringr::str_remove(string = y[92], pattern = "é ")
y[115] <- stringr::str_remove(string = y[115], pattern = ": ")
y[119] <- stringr::str_remove(string = y[119], pattern = "- ")
y[121] <- stringr::str_remove(string = y[121], pattern = "z ")
y[122] <- stringr::str_remove(string = y[122], pattern = "\\% ")
y[145] <- stringr::str_remove(string = y[145], pattern = "2 ")
y[146] <- stringr::str_remove(string = y[146], pattern = "é ")
y[147] <- stringr::str_remove(string = y[147], pattern = "5 ")
y[148] <- stringr::str_remove(string = y[148], pattern = "2 ")
y[149] <- stringr::str_remove(string = y[149], pattern = "\\| ")
y[152] <- stringr::str_remove(string = y[152], pattern = "2 ")
y[120] <- stringr::str_remove(string = y[120], pattern = "= ")

y <- y[9:length(y)]
y <- y[y != ""]

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 13,
                date = as.Date("17/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution13 <- tibble::tibble(y)

usethis::use_data(iatfResolution13, overwrite = TRUE, compress = "xz")

## Resolution 14 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-14.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[y != ""]

y <- y[c(5:34, 36:69, 71:107, 109:146, 148:186, 188:length(y))]

y[182] <- stringr::str_replace(string = y[182], pattern = "so p", replacement = "Club House, Camp")
y[183] <- "EDUARDO M. AÑO"
y[184] <- "Secretary, Department of the Interior and Local Government"
y[185] <- "BERNADETTE ROMULO-PUYAT"
y[186] <- "Secretary, Department of Tourism"
y[187] <- "SILVESTRE H. BELLO III"
y[188] <- "Secretary, Department of Labor and Employment"
y[189] <- "GREGORIO B. HONASAN II"
y[190] <- "Secretary, Department of Information and Communications Technology"
y[191] <- y[194]
y[192] <- y[195]
y[193] <- "DEO L. MARCO"
y[194] <- "Undersecretary, Department of Justice"
y[195] <- "BRIGIDO D. DULAY"
y[196] <- "Undersecretary, Department of Foreign Affairs"
y[197:198] <- y[200:201]
y[199] <- y[203]
y[200] <- "KARLO ALEXEI B. NOGRALES"
y[201] <- y[205]
y[202:203] <- y[206:207]
y[204] <- "RAMON M. LOPEZ"
y[205] <- y[209]
y[206] <- "ROLANDO D. BAUTISTA"
y[207] <- y[211]
y[208:209] <- y[215:216]
y[210] <- "ROY A. CIMATU"
y[211] <- y[219]
y[212:213] <- y[220:221]
y[214] <- "RICARDO B. JALAD"
y[215] <- y[224]
y[216] <- stringr::str_remove(string = y[228], pattern = " \\|")
y[217] <- stringr::str_remove(string = y[229], pattern = " \\|")

y <- y[c(1:217, 230:243)]

y[218] <- stringr::str_remove(string = y[218], pattern = " :")
y[219] <- stringr::str_remove(string = y[219], pattern = " \\|")
y[220] <- stringr::str_remove(string = y[220], pattern = " \\|")
y[221] <- stringr::str_remove(string = y[221], pattern = " \\|")
y[222] <- stringr::str_remove(string = y[222], pattern = " :")
y[223] <- stringr::str_remove(string = y[223], pattern = " oe")
y[224] <- stringr::str_remove(string = y[224], pattern = " \\|")
y[225] <- stringr::str_remove(string = y[225], pattern = " :")
y[226] <- stringr::str_remove(string = y[226], pattern = " ,")
y[227] <- stringr::str_remove(string = y[227], pattern = " \\|")
y[228] <- stringr::str_remove(string = y[228], pattern = " \\|")
y[229] <- stringr::str_remove(string = y[229], pattern = " 2")
y[230] <- stringr::str_remove(string = y[230], pattern = " !")
y[231] <- stringr::str_remove(string = y[231], pattern = " 4")

y[144] <- stringr::str_remove(string = y[144], pattern = "\\| ")
y[68] <- stringr::str_remove(string = y[68], pattern = ". ")
y[73] <- stringr::str_remove(string = y[73], pattern = ". ")
y[124] <- stringr::str_replace(string = y[124], pattern = "ui.", replacement = "iii.")

y <- y[10:length(y)]

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 14,
                date = as.Date("20/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution14 <- tibble::tibble(y)

usethis::use_data(iatfResolution14, overwrite = TRUE, compress = "xz")

## Resolution 15 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-15.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- stringr::str_remove_all(string = y, pattern = "\\| |\\||= |\\/ |\\|!")
y <- y[y != ""]

y <- y[c(6:34, 43:69, 76:104, 113:123, 125:133, 135:142, 151:181, 191:208, 211:214)]

y[97] <- stringr::str_replace(string = y[97], pattern = "].", replacement = "1.")
y[132] <- stringr::str_remove(string = y[150], pattern = "1 ")
y[150] <- stringr::str_remove(string = y[150], pattern = "! ")

y[18] <- stringr::str_replace(string = y[18], pattern = "\\[ATF", replacement = "IATF")
y[163] <- "EDUARDO MAÑO"

y <- y[c(9:143, 145:length(y))]

y[101] <- stringr::str_replace(string = y[101], pattern = "OF Ws", replacement = "OFWs")
y[104] <- stringr::str_replace(string = y[104], pattern = "OF Ws", replacement = "OFWs")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 15,
                date = as.Date("25/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution15 <- tibble::tibble(y)

usethis::use_data(iatfResolution15, overwrite = TRUE, compress = "xz")

## Resolution 16 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-RESO-16.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(5:length(y))]
y <- y[y != ""]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 16,
                date = as.Date("30/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution16 <- tibble::tibble(y)

usethis::use_data(iatfResolution16, overwrite = TRUE, compress = "xz")

## Resolution 17 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF Resolution No. 17.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:70, 74:75, 77:101, 104:119, 121, 124:139, 142:157, 160:165)]

y <- y[y != ""]

y[104] <- "SALVADOR C. MEDIALDEA"

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 17,
                date = as.Date("30/03/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution17 <- tibble::tibble(y)

usethis::use_data(iatfResolution17, overwrite = TRUE, compress = "xz")

## Resolution 18 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-RESO-18.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(1:44, 51:91, 97:137)]
y <- y[y != ""]

y[1] <- "REPUBLIC OF THE PHILIPPINES"
y[2] <- "INTER-AGENCY TASK FORCE"
y[3] <- "FOR THE MANAGEMENT OF EMERGING INFECTIOUS DISEASE"
y[4] <- ""

y <- y[y != ""]
y <- y[9:length(y)]

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 18,
                date = as.Date("01/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution18 <- tibble::tibble(y)

usethis::use_data(iatfResolution18, overwrite = TRUE, compress = "xz")

## Resolution 19 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF Resolution No. 19.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(1:35, 41:70, 76:108, 114:129, 135:149, 155:169, 175:188)]

y[140] <- "RYAN ALVIN R. ACOSTA"

y[141] <- ""
y <- y[y != ""]
y <- y[9:length(y)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 19,
                date = as.Date("03/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution19 <- tibble::tibble(y)

usethis::use_data(iatfResolution19, overwrite = TRUE, compress = "xz")

## Resolution 20 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-20.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:36, 42:57, 64:77, 83:93, 95:97, 103:116)]

y[69] <- "RYAN ALVIN R. ACOSTA"

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 20,
                date = as.Date("06/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution20 <- tibble::tibble(y)

usethis::use_data(iatfResolution20, overwrite = TRUE, compress = "xz")

## Resolution 21 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/Revised-IATF-Resolution-No.-21.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:35, 41:72, 78:111, 117:132, 138:152, 158:166, 168:173, 179:189)]

y[133] <- "RYAN ALVIN R. ACOSTA"
y[30] <- "3. The Abok Kamay ang Pagtulong (AKAP) so OFWs program."

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 21,
                date = as.Date("06/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution21 <- tibble::tibble(y)

usethis::use_data(iatfResolution21, overwrite = TRUE, compress = "xz")

## Resolution 22 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-22.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y[177] <- "RICARDO P. BERNABE III"

y <- y[c(9:33, 38:68, 73:88, 90:93, 95:104, 109:131, 136:150, 155:168, 173:177, 179:189, 194:199)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 22,
                date = as.Date("08/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution22 <- tibble::tibble(y)

usethis::use_data(iatfResolution22, overwrite = TRUE, compress = "xz")

## Resolution 23 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/Revised-IATF-Resolution-No.-23.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y[143] <- "RICARDO P. BERNABE III"

y <- y[c(9:36, 41:75, 80:99, 104:118, 123:137, 142:143, 145:156, 161:165)]

y[128] <- stringr::str_replace(string = y[128], pattern = "Comm\\\\nt", replacement = "Commandant")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 23,
                date = as.Date("13/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution23 <- tibble::tibble(y)

usethis::use_data(iatfResolution23, overwrite = TRUE, compress = "xz")

## Resolution 24 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-24.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y[123] <- "RICARDO P. BERNABE III"

y <- y[c(9:34, 39:67, 72:87, 92:104, 109:123, 125, 130:143, 148:149)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 24,
                date = as.Date("15/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution24 <- tibble::tibble(y)

usethis::use_data(iatfResolution24, overwrite = TRUE, compress = "xz")

## Resolution 25 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-25.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:33, 40:45, 47:67, 75:95)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 25,
                date = as.Date("17/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution25 <- tibble::tibble(y)

usethis::use_data(iatfResolution25, overwrite = TRUE, compress = "xz")

## Resolution 26 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-26.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:34, 39:43, 50:70)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 26,
                date = as.Date("20/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution26 <- tibble::tibble(y)

usethis::use_data(iatfResolution26, overwrite = TRUE, compress = "xz")

## Resolution 27 ###############################################################

x <- pdf_text(pdf = "data-raw/IATF/IATF-Resolution-No.-27.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:35, 40:70, 75:79, 86:106)]

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 27,
                date = as.Date("22/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution27 <- tibble::tibble(y)

usethis::use_data(iatfResolution27, overwrite = TRUE, compress = "xz")

## Resolution 28 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-28.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(12:46, 64:99, 109:131, 139:172)]

y <- y[y != ""]

y[74] <- "minutes of the meeting, held this 23rd April, 2020 via video conference."
y[75] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[76] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[77] <- "IATF Chairperson         IATF Co-Chairperson"

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 28,
                date = as.Date("23/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution28 <- tibble::tibble(y)

usethis::use_data(iatfResolution28, overwrite = TRUE, compress = "xz")

## Resolution 29 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-29.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(14:48, 55:90, 98:109, 115:149)]
y <- y[y != ""]

y[69] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[70] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[71] <- "IATF Chairperson         IATF Co-Chairperson"
y[74] <- "1. I am presently an Assistant Secretary of the Department of Health;"
y[83] <- stringr::str_replace(string = y[83], pattern = "\\[", replacement = "I")
y[84] <- stringr::str_replace(string = y[84], pattern = "\\[", replacement = "I")
y[87] <- stringr::str_replace(string = y[87], pattern = "\\[", replacement = "I")
y[93] <- stringr::str_replace(string = y[93], pattern = "1g!", replacement = "28th")
y[95] <- "Kenneth G. Ronquillo, MD, MPHM"
y[97] <- stringr::str_replace(string = y[97], pattern = "\\[", replacement = "I")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 29,
                date = as.Date("27/04/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution29 <- tibble::tibble(y)

usethis::use_data(iatfResolution29, overwrite = TRUE, compress = "xz")

## Resolution 31 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-31.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:51, 63:97, 107:131)]
y <- y[y != ""]

y[59] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[60] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[61] <- "IATF Chairperson         IATF Co-Chairperson"
y[73] <- stringr::str_replace(string = y[73], pattern = "\\[", replacement = "I")
y[74] <- stringr::str_replace(string = y[74], pattern = "\\[", replacement = "I")
y[77] <- stringr::str_replace(string = y[77], pattern = "\\[", replacement = "I")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 31,
                date = as.Date("01/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution31 <- tibble::tibble(y)

usethis::use_data(iatfResolution31, overwrite = TRUE, compress = "xz")

## Resolution 32 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-32.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:44, 53:94, 103:123, 136:170)]
y <- y[y != ""]

y[80] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[81] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[82] <- "IATF Chairperson         IATF Co-Chairperson"
y[94] <- stringr::str_replace(string = y[94], pattern = "\\[", replacement = "I")
y[95] <- stringr::str_replace(string = y[95], pattern = "\\[", replacement = "I")
y[98] <- stringr::str_replace(string = y[98], pattern = "\\[", replacement = "I")
y[102] <- stringr::str_remove(string = y[102], pattern = "\\[")
y[108] <- stringr::str_replace(string = y[108], pattern = "\\[", replacement = "I")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 32,
                date = as.Date("04/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution32 <- tibble::tibble(y)

usethis::use_data(iatfResolution32, overwrite = TRUE, compress = "xz")

## Resolution 33 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-33.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:46, 53:93, 103:122, 130:164)]
y <- y[y != ""]

y[79] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[80] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[81] <- "IATF Chairperson         IATF Co-Chairperson"
y[93] <- stringr::str_replace(string = y[93], pattern = "\\[", replacement = "I")
y[94] <- stringr::str_replace(string = y[94], pattern = "\\[", replacement = "I")
y[97] <- stringr::str_replace(string = y[97], pattern = "\\[", replacement = "I")
y[103] <- stringr::str_remove(string = y[103], pattern = "\\[")
y[107] <- stringr::str_replace(string = y[107], pattern = "\\[", replacement = "I")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 33,
                date = as.Date("06/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution33 <- tibble::tibble(y)

usethis::use_data(iatfResolution33, overwrite = TRUE, compress = "xz")

## Resolution 34 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-34.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:46, 52:76, 79:90, 97:98, 100:103, 105:108, 110:130, 136:147, 153:187)]
y <- y[y != ""]

y[97] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[98] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[99] <- "IATF Chairperson         IATF Co-Chairperson"

y <- stringr::str_replace_all(string = y, pattern = "\\[ATF", replacement = "IATF")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 34,
                date = as.Date("08/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution34 <- tibble::tibble(y)

usethis::use_data(iatfResolution34, overwrite = TRUE, compress = "xz")

## Resolution 35 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-35.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:45, 52:90, 98:131, 141:165, 173:207)]
y <- y[y != ""]

y[115] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[116] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[117] <- "IATF Chairperson         IATF Co-Chairperson"

y <- stringr::str_replace_all(string = y, pattern = "\\[ATF", replacement = "IATF")

y <- stringr::str_replace_all(string = y, pattern = "\\[", replacement = "I")

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 35,
                date = as.Date("11/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution35 <- tibble::tibble(y)

usethis::use_data(iatfResolution35, overwrite = TRUE, compress = "xz")

## Resolution 36 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-36.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(9:46, 54:93, 101:131)]
y <- y[y != ""]

y[88] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[89] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[90] <- "IATF Chairperson         IATF Co-Chairperson"

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 36,
                date = as.Date("13/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution36 <- tibble::tibble(y)

usethis::use_data(iatfResolution36, overwrite = TRUE, compress = "xz")

## Resolution 37 ###############################################################

x <- pdf_ocr_text(pdf = "data-raw/IATF/IATF-Resolution-No.-37.pdf")

## Restructure text
y <- unlist(stringr::str_split(string = x, pattern = "\n"))

y <- y[c(13:49, 58:76)]
y <- y[y != ""]

y[47] <- "Francisco T. Duque III       Karlo Alexei B. Nograles"
y[48] <- "Secretary, Department of Health     Cabinet Secretary, Office of the Cabinet Secretary"
y[49] <- "IATF Chairperson         IATF Co-Chairperson"

y <- stringr::str_trim(string = y, side = "both")

y <- data.frame(linenumber = 1:length(y),
                text = y,
                source = "IATF",
                type = "resolution",
                id = 37,
                date = as.Date("15/05/2020", format = "%d/%m/%y"),
                stringsAsFactors = FALSE)

iatfResolution37 <- tibble::tibble(y)

usethis::use_data(iatfResolution37, overwrite = TRUE, compress = "xz")
