#include<stdio.h>
#include<time.h>
#include<stdlib.h>

/* programa que busca un item burkert en la lista de precios, desplegando la descripcion, el precio lista, el descuento y el precio neto */

void main()
{

    FILE *fopen(), *fp;
    int c;
    int linea=0;
    char item[8];
    int i=0;

    fp = fopen("burkert-2015-PL.txt","r");   /* crear primero archivo */
    c = getc(fp) ;              /* devuelve un caracter desde un archivo y lo asiga a c */
    
    printf(" LISTA DE PRECIOS BURKERT 2015 \n");

    while (c != EOF)            /* mientras c sea diferente de end of file EOF */
    {
        putchar(c);             /*visualiza c en la salida estandard */
        if (c=='\n')
            printf("empieza linea \t");
        c = getc(fp);           /* devuelve un caracter desde un archivo y lo asigna a C*/                                                   
    
    }    
    fclose(fp);
}
