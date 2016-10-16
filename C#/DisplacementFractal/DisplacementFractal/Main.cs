using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DisplacementFractal
{
    class Main
    {
        public Main()
        {

        }

        public void Run()
        {
            // Random Midpoint Displacement Fractal level
            int level = 8;

            // create terrain object
            Terrain terrain = Terrain.GetInstance(level);

            // generate terrain with smoothness factor (the lower, the more smooth the terrain) - perform the algorithm
            terrain.generate(0.1);

            // get the terrain coordinate map after performing the algorithm.
            float[] map = terrain.getMap();

            
            /////// CONCATENATE THE RESULTS AND PLACE THEM IN A TEXT FILE

            int rowscols = (int)Math.Pow(2, level) + 1 ;
            string[] text = new string[rowscols];

            for (int i = 0; i < rowscols ;i++)
            {
                string lel = "";
                for(int j = 0; j < rowscols;j++)
                {
                    lel += map[i * rowscols + j] + " ";
                }
                text[i] = lel;
            }

            System.IO.File.WriteAllLines(@"D:\coords.txt", text);


            // shutdown application
            Application.Current.Shutdown();
        }

    }
}
