// imprime un archivo txt

#include<stdio.h>

int main()
{
    FILE *fopen(), *direccionMemoriaArchivo;		/* se declara un apuntador de archivo y un apuntador */
		char caracter;

			printf("***Character Attributes from a file***\n\n");
			printf("read file, terminate with EOF \n");
      direccionMemoriaArchivo = fopen("plburkert2015procesado.txt","r");
			caracter = getc(direccionMemoriaArchivo); 

// The getc() function reads a single character from the current stream position and advances the stream position to the next character
// read the first char

	while (caracter != EOF) 
    {
        putchar(caracter);
        caracter=getc(direccionMemoriaArchivo);
		}
        fclose(direccionMemoriaArchivo);
}				/* end of program */
