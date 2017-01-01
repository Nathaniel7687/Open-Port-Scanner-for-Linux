#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main(int cnt, char *content[])
{
        int i = 0;
        char shell[1024];

        if(cnt < 4)
                exit(0);

        omp_set_num_threads(20);
        #pragma omp parallel for
        for(i = atoi(content[2]); i < atoi(content[3]); i++) {
                sprintf(shell, "nmap -PN %s -p%d | egrep \'closed|open\'", content[1], i);
                system(shell);
        }

        return 0;
}
