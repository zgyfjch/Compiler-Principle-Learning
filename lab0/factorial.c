#include<stdio.h>
int factorial(int n)
{
    int ans=1;
    for(int i=1;i<=n;i++)
    {
        ans=ans*i;
    }
    return ans;
}
int main()
{
    int n;
    scanf("%d",&n);
    printf("%d\n",factorial(n));
    return 0;
}