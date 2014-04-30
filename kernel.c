/*
 * kernel.c
 */
void kmain (void)
{
	char *str = "my first kernel!";
	char *str2 = "1+2+...+100=";
	char *vidptr=(char*)0x000b8000;
	unsigned int i=0;
	unsigned int j=0;
	//clear all
	while(j<80*25*2) {
		//blank character
		vidptr[j]=' ';
		//attributer-byte: light grey on blank screen
		vidptr[j+1]=0x07;
		j=j+2;
	}
	i=0;
	j=0;
	while(str[j]!='\0') {
		vidptr[i]=str[j];
		vidptr[i+1]=0x07;
		++j;
		i=i+2;
	}
	i=1*80*2;
	j=0;
	while(str2[j]!='\0') {
		vidptr[i]=str2[j];
		vidptr[i+1]=0x07;
		++j;
		i=i+2;
	}
	int sum=0, x;
	for(x=0;x<=100;x++){
		sum+=x;
	}
	i=2*80*2+5*2;
	while(sum!=0)
	{
		vidptr[i]=sum%10+'0';
		i-=2;
		sum=sum/10;
	}
	return;
}
