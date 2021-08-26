int
main (void)
{
  int sum = 123;
  for (int i = 0; i < 100; i++)
    {
      if (i % 3 != 0)
    sum += i;
    }
  return 0;
}
