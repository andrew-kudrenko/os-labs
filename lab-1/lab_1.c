#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
   printf("Real User ID = %d\n",getuid());
   printf("Effective User ID = %d\n\n",geteuid());

   printf("Real Group ID = %d\n",getgid());
   printf("Effective Group ID = %d\n\n",getegid());

   return 0;
}
