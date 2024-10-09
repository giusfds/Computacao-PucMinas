#include <stdio.h>
#include <math.h>

double f_questao01(double x)
{
  return 2 * sqrt(16 - x * x);
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

void questao01()
{
  double a, b;
  int n;

  printf("Digite o limite inferior (a): ");
  scanf("%lf", &a);
  printf("Digite o limite superior (b): ");
  scanf("%lf", &b);
  printf("Digite o numero de subdivisoes (n): ");
  scanf("%d", &n);

  double resultado = integral(f_questao01, a, b, n);
  printf("resultado %.10lf\n",resultado);
}

void main(){
  questao01();
}

