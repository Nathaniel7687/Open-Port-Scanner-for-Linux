#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int cnt, char *content[])
{
        int i = 0;
        char shell[1024];

        if(cnt < 3)
                exit(0);

        cnt = 0;
        omp_set_num_threads(20);
        #pragma omp parallel for
        for(i = atoi(content[1]); i < atoi(content[2]); i++) {
                printf("No. %5d / %5d\n", i, cnt++);
                sprintf(shell, "nmap -PN 210.119.104.155 -p%d | egrep \'closed|open\'", i);
                system(shell);
        }

        return 0;
}
