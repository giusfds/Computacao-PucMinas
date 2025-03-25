#include <stdio.h>
#include <math.h>

double fun(double x)
{
  return 12 / sqrt(9 - x * x);
}

double integral(double (*f)(double), double a, double b, int n)
{
  double deltaX = (b - a) / n;
  double soma = 0.0;

  for (int i = 0; i < n; i++)
  {
    double xi = a + i * deltaX;
    soma += f(xi) * deltaX;
  }

  return soma;
}

void q02 (){
  double a, b;
  int n;

  printf("digite o valor de A: ");
  scanf("%f", &a);
  printf("\ndigite o valor de B: ");
  scanf("%f", &b);
  printf("\ndigite o valor de N: ");
  scanf("%d", &n);

  double resultado = integral(fun, a, b, n);
  printf("resultado %.10lf\n",resultado);
}

void main(){
  q02();
}

