#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

#define N_PROCESOS 3

int I = 0;

void cod_del_proceso(int id, int t) {
    int i;
    for(i = 0; i < 5; i++) {
        printf("\nProceso %d | i = %d | I = %d\n", id, i, I);
        I++;
    }
    printf("Proceso %d entrando en pausa...\n", id);
    pause(); // El proceso se queda esperando una señal
    exit(t);
}

int main() {
    pid_t pid;
    int p, edo;

    for(p = 0; p < N_PROCESOS; p++) {
        pid = fork();
        if(pid == -1) {
            perror("Error a la llamada fork");
            exit(-1);
        } else if(pid == 0) {
            // Código del hijo
            cod_del_proceso(getpid(), p + 1);
        } else {
            // Código del padre
            printf("\n\t\tSOY EL PADRE | Mi PID: %d | PPID: %d | PID hijo: %d", getpid(), getppid(), pid);
        }
    }

    printf("\nPadre durmiendo 20 segundos antes de recolectar hijos...\n");
    sleep(20);

    for(p = 0; p < N_PROCESOS; p++) {
        pid = wait(&edo);
        printf("\nTerminó proceso %d con estado %x\n", pid, edo >> 8);
    }

    exit(0);
}