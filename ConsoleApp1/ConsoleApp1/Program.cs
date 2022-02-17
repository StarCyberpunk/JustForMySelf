using System;
using System.Collections.Generic;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            //Init
            Random rnd = new Random();
            int[] n = new int[20];
           
            for(int i = 0; i < n.Length; i++)
            {
                n[i] = rnd.Next(0, 9);
            }
            Array.Sort(n);
            //copy array
            int[] nn = new int[n.Length];
            for (int i = 0; i < n.Length; i++)
            {
                nn[i] = n[i];
            }
            //take pair
            for (int i = 0; i < n.Length-1; i++)
            {
                if (nn[i] == nn[i + 1])
                {
                    nn[i] = Int32.MinValue;
                    nn[i+1] = Int32.MinValue;
                }  
                
            }
            //output
            for (int i = 0; i < nn.Length ; i++)
            {
                if (nn[i] != Int32.MinValue)
                {
                    Console.WriteLine(nn[i]);
                }

            }
            Console.ReadKey();

            

            
        }
    }
}
