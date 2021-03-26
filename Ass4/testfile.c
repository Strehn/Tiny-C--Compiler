// C-S21
// just test all the ops mostly in a singlton expression
//
int y[10];
bool x;

main()
{
    int a;
    int b;
    int c;
    bool z;

    y[0] = 50;
    y[5] = 1;
    y[8] = 2;

    a = 50;
    b = 1;
    c = 8;

    x = false;
    z = true;

    outputb(a <= 1);            // F
    outputb(b <= 50);           // T
    outputb(50 <= 50);          // T
    outnl();

    outputb(50<1);              // F
    outputb(b<a);               // T
    outputb(a<a);               // F
    outnl();

    outputb(50>1);              // T
    outputb(1>50);              // F
    outputb(50>50);             // F
    outnl();

    outputb(50 >= 1);           // T
    outputb(1 >= 50);           // F
    outputb(50 >= 50);          // T
    outnl();

    outputb(y[0] == b);         // F
    outputb(a == b);            // F
    outputb(b == b);            // T
    outnl();

    outputb(y[0] != a);         // F
    outputb(y[0] != b);         // T
    outputb(a != b);            // T
    outputb(b != b);            // F
    outnl();

    outputb(true    and    true);     // T
    outputb(true    and    false);    // F
    outputb(false    and    true);    // F
    outputb(false    and    false);   // F
    outnl();

    outputb(true    or    true);     // T
    outputb(z    or    false);       // T
    outputb(false    or    true);    // T
    outputb(false    or    false);   // F
    outnl();

    outputb(  not   true);           // F
    outputb(  not   false);          // T
    outputb(  not   x);              // T
    outputb(  not   not   not   x);            // T
    outnl();

    output(5 + 50);             // 55
    output(y[c] + 50);          // 52
    outnl();

    output(5 - 50);             // -45
    output(30 - 5 - 50);        // -25
    outnl();

    a = 50;
    output(-a);                 // -50
    output(- -a);                // 50
    output(-a);                 // -50
    output(-0);                 // 0
    output(-1);                 // -1
    outnl();

    output(2*3*5*7*11);         // 2310
    output(50*y[8]);            // 100
    output(y[8]*50);            // 100
    outnl();

    output(50/y[8]);            // 25
    output(y[8]/50);            // 0
    output(y[8]/b);             // 2
    output(210/7/3);            // 10
    outnl();

    // note that negative mod is problematic in its definition
    output(211%7);              // 1
    output(211%6);              // 1
    output(211%5);              // 1
    output(211%4);              // 3
    output(211 - 211/4*4);      // 3
    output(211%100%3);          // 2
    outnl();

    output(a = b = c = 43);     // 43
    output(a);                  // 43
    a = (b=3) * (c = 4);
    output(a);                  // 12
    outnl();

    a = 44;
    b = 2;
    output(a+=b);                // 46
    output(a-=b);                // 44
    output(a-=a);                // 0
    output(a+=b+=10);            // 12
    outnl();

    a = 44;
    b = 2;
    output(a*=b);                // 88
    output(a/=b);                // 44
    output(a/=a/=2);             // 1
    output(a*=b*=10);            // 20
    outnl();

    a = 44;
    b = 2;
    output(a++);                 // 45
    output(b--);                 // 1
    outnl();

    output(3-4-5);               // -6
    output(211/17/5);            //  2
    output(211/(17/5));            // 70
    outnl();

    outputb((true   or   false)   and   false); // F
    outputb(true   or   false   and   false);   // T
    outputb(true   or   (false   and   false)); // T
    outnl();

    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?3 < 3);               // T
    outputb(?1 == 0);              // T
    outnl();

    outputb(?10000 > 0);           // T   probably
    outputb(?10000 > 0);           // T   probably
    outnl();
}

