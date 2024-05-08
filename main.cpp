#include <iostream>
#define LOG(x) std::cout << x << std::endl;
int SumRange(int x, int y);
int SumRangeRecursively(int x, int y , int total);
int factorial( int x);
int main()
{
    int total = 0;
    LOG("sum range with negative numbers(smaller to bigger): " << SumRangeRecursively(10, -1,total)); // 54
    LOG("sum with both are negatives: " << SumRangeRecursively(-1, -10,total));                       //-55
    LOG("sum range with both positive integers: " << SumRangeRecursively(10, 1,total));               // 55
    LOG("Factorial: "<<factorial(3));
    return 0;
}
int SumRange(int x, int y)
{
    int total = 0;
    while (x <= y)
    {
        total += x;
        x++;
    }
    return total;
}
int SumRangeRecursively(int x, int y, int total)
{
    if (x == y)
    {
        total = x;
        return total ;

    }
    if (x <= y)
        return SumRangeRecursively(x + 1, y, total) +x;
    
    if(x>= y)
        return SumRangeRecursively(x,y+1,total) +y;
    return total;
}
int factorial( int x)
{
    if(x ==0)
    return 1;
    return x* factorial(x-1);

}
