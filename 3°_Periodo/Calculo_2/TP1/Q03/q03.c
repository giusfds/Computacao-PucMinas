#include <stdio.h>
#include <math.h>

#define PI 3.14159265359

double fun (double x){
  return 2 * PI * 2 * sqrt(4 - pow(x - 4, 2));
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

void q03 (){
  double a, b;
  int n;

  printf("digite o valor de A: ");
  scanf("%lf", &a);
  printf("\ndigite o valor de B: ");
  scanf("%lf", &b);
  printf("\ndigite o valor de N: ");
  scanf("%d", &n);

  double resultado = integral(fun, a, b, n);
  printf("resultado %.10lf\n",resultado);
}