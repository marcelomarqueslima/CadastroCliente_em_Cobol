      ******************************************************************
      * Author: Marcelo Marques de Lima
      * Date: 22/04/2020
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID. CADCLIENTE.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT OPTIONAL FILE1 ASSIGN TO DISK
           ORGANIZATION INDEXED
           ACCESS MODE RANDOM
           ALTERNATE KEY CLI_RAZAOSOCIAL WITH DUPLICATES
           ALTERNATE KEY CLI_ALT_BUSCA WITH DUPLICATES
           FILE STATUS IS FS-STAT
           RECORD KEY IS ID_CLIENTE.

       DATA DIVISION.

       FILE SECTION.

       FD FILE1 VALUE OF CLI_ID IS "./cliete.dat".

       01 FILE1-REC.
           05 ID_CLIENTE.
               10 CLI_ID                       PIC 9(8).
           05 CLI_NOMEFANTASIA                 PIC X(80).
           05 CLI_RAZAOSOCIAL                  PIC X(80).
           05 CLI_ENDERECO                     PIC X(80).
           05 CLI_NUMERO                       PIC 9(10).
           05 CLI_BAIRRO                       PIC X(50).
           05 CLI_CIDADE                       PIC X(50).
           05 CLI_ESTADO                       PIC X(2).
           05 CLI_TELEFONE                     PIC S9(2)V9(8).
           05 CLI_CELULAR                      PIC S9(2)V9(9).
           05 CLI_ALT_BUSCA.
               10 CLI_CATEGORIA_BUSCA          PIC X.
               10 CLI_NOMEFANTASIA_BUSCA       PIC X(80).
               10 CLI_RAZAOSOCIAL_BUSCA        PIC X(80).
           05 FILLER                           PIC X(300).

       WORKING-STORAGE SECTION.

       01 WS-MODULO.
           05 FILLER PIC X(11) VALUE "CLIENTES -".
           05 WS-OP  PIC X(20) VALUE SPACE.

       77 WS-OPCAO PIC X.
           88 E-INCLUIR   VALUE IS "1".
           88 E-CONSULTAR VALUE IS "2".
           88 E-ALTERAR   VALUE IS "3".
           88 E-EXCLUIR   VALUE IS "4".
           88 E-ENCERRAR  VALUE IS "X" "x".

       77 FS-STAT PIC 9(02).
           88 FS-OK         VALUE ZEROS.
           88 FS-CANCELA    VALUE 99.
           88 FS-NAO-EXISTE VALUE 35.

       77 WS-ERRO PIC X.
           88 E-SIM VALUES ARE "S" "s".

       77 WS-NUML PIC 999.
       77 WS-NUMC PIC 999.
       77 COR-FUNDO PIC 9 VALUE 1.
       77 COR-FRENTE PIC 9 VALUE 6.

       77 WS-STATUS PIC X(30).
       77 WS-MSGERRO PIC X(80).

       COPY screenio.

       SCREEN SECTION.

       01 SS-CLS.
           05 SS-FILLER.
               10 BLANK SCREEN.
               10 LINE 01 COLUMN 01 ERASE EOL
                  BACKGROUND-COLOR COR-FUNDO.
               10 LINE WS-NUML COLUMN 01 ERASE EOL
                  BACKGROUND-COLOR COR-FUNDO.
           05 SS-CABECALHO.
               10 LINE 01 COLUMN 02 PIC X(31) FROM WS-MODULO
                  HIGHLIGHT FOREGROUND-COLOR COR-FRENTE
                  BACKGROUND-COLOR COR-FUNDO.
           05 SS-STATUS.
               10 LINE WS-NUML COLUMN 2 ERASE EOL PIC X(30)
                  FROM WS-STATUS HIGHLIGHT
                  FOREGROUND-COLOR COR-FRENTE
                  BACKGROUND-COLOR COR-FUNDO.

       01 SS-MENU FOREGROUND-COLOR 6.
           05 LINE 07 COLUMN 15 VALUE "1 - INCLUIR".
           05 LINE 08 COLUMN 15 VALUE "2 - CONSULTAR".
           05 LINE 09 COLUMN 15 VALUE "3 - ALTERAR".
           05 LINE 10 COLUMN 15 VALUE "4 - EXCLUIR".
           05 LINE 11 COLUMN 15 VALUE "X - ENCERRAR".
           05 LINE 13 COLUMN 15 VALUE "OPÇÃO: ".
           05 LINE 13 COL PLUS 1 USING WS-OPCAO AUTO.

       PROCEDURE DIVISION.

       END PROGRAM CADCLIENTE.
