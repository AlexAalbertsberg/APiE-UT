using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DisplacementFractal
{
    public class Terrain
    {
        // singleton instance of the terrain
        private static Terrain _instance;

        // terrain variables
        private int size;
        private int max; // max coord
        private float[] map;
        
        // roughness of the terrain
        private double roughness;

        // random object holder
        private Random r;

        private Terrain(int level)
        {
            // initialize terrain
            size = (int)Math.Pow(2, level) + 1;
            max = size - 1;
            map = new float[size*size];

            // initialize random object
            r = new Random();
        }

        // Singleton initializer for the Terrain.
        public static Terrain GetInstance(int level)
        {
            if (_instance == null) _instance = new Terrain(level);

            return _instance;
        }

        // Helper function to get a certain value at coordinate (x,y)
        public float get(int x, int y)
        {
            if (x < 0 || x > max || y < 0 || y > max) return -1;
            return map[x + size * y];
        }

        // Helper function to set a certain value at coordinate (x,y)
        public void set(int x,int y, float val)
        {
            map[x + size * y] = val;
        }

        // initialize RMDF algorithm
        public void generate(double roughness)
        {
            // set roughness
            this.roughness = roughness;

            // set corner values
            set(0, 0, 1);
            set(max, 0, 1);
            set(max, max, 1);
            set(0, max, 1);

            // start division step
            divide(max);
        }

        public void divide(int sz)
        {
            // calculate half of current square size
            var half = sz / 2;
            // calculate scale of random numbers
            var scale = roughness * sz;

            // if square is too small, end function
            if (half < 1)
            {
                return;
            }
            else
            {
                // for all squares to be considered in the current step, perform square and diamond steps according to the RMDF algorithm.
                for (var y = half; y < max; y += sz)
                {
                    for (var x = half; x < max; x += sz)
                    {
                        square(x, y, half, (float)(r.NextDouble() * scale * 2 - scale));
                    }
                }

                for (var y = 0; y <= max; y += half)
                {
                    for (var x = (y + half) % sz; x <= max; x += sz)
                    {
                        diamond(x, y, half, (float)(r.NextDouble() * scale * 2 - scale));
                    }
                }

                // divide squares in half recursively
                divide(sz / 2);
            }
        }

        public void square(int x, int y, int half, float offset)
        {
            float[] test = new float[4];

            // get neighboring values
            test[0] = get(x - size, y - size);
            test[1] = get(x + size, y - size);
            test[2] = get(x + size, y + size);
            test[3] = get(x - size, y + size);

            // calculate average of neighboring values
            var ave = average(test);

            // set value of coordinate (x,y) to average plus the scaled offset
            set(x, y, ave + offset);
        }
        
        public void diamond(int x, int y, int half, float offset)
        {
            float[] test = new float[4];

            // get neighboring values
            test[0] = get(x, y - size);
            test[1] = get(x + size, y);
            test[2] = get(x, y + size);
            test[3] = get(x - size, y);

            // calculate average of neighboring values
            var ave = average(test);

            // set value of coordinate (x,y) to average plus the scaled offset
            set(x, y, ave + offset);
        }

        public float average(float[] test)
        {
            // ignore all nonexistent values
            float[] valid = test.Where(f => f != -1).ToArray();
            // sum the values together
            float total = valid.Sum();

            // if there are existing values in the array, calculate the average. if none exist, return 0
            if (valid.Length > 0)
            {
                return total / valid.Length;
            }
            return 0;
        }

        // returns the coordinate map of the Terrain.
        public float[] getMap()
        {
            return map;
        }
    }
}
