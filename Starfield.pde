Particle [] thingies;

void setup()
{
	size(666,666);
	thingies = new Particle[666];

	for (int i = 0; i<thingies.length; i++) 
	{
		thingies[i] = new NormalParticle();
		if (i%100==0) 
		{
			thingies[i] = new JumboParticle();
	    }

	}
	thingies[0] = new OddballParticle();
}

void draw()
{
	background(255);

	for (int i = 0; i<thingies.length; i++)
	{
	thingies[i].move();
	thingies[i].show();
	}
}

class NormalParticle implements Particle
{
	double x ,y ,speed ,position;

	NormalParticle() 
	{
		x = 169;
		y = 169;
		speed = Math.random()*4+1;
		position = Math.random()*2*Math.PI;
	}

	public void move()
	{
		x = (Math.cos(position) * speed) + x;
		y = (Math.sin(position) * speed) + y;

		if (x<=0 || x>=666 || y<=0 || y>=666)
		{
			x = 169;
			y = 169;
			speed    = Math.random()*3;
			position = Math.random()*2;
		}
	}

	public void show()
	{
		fill(random(0,255),random(0,255),random(0,255));
		ellipse((float)x, (float)y, 15, 15);
	}
}

interface Particle
{
	public void move();
	public void show();
}

class OddballParticle implements Particle
{
	double x,y;

	OddballParticle()
	{
		x = Math.random()*666;
		y = Math.random()*666;
	}

	public void move()
	{
		x = x + Math.random()*5;
		y = y + Math.random()*5; 
	}

	public void show() 
	{
		fill(random(0,255),random(0,255),random(0,255));
		ellipse((float)x, (float)y, 69, 69);
	}
}

class JumboParticle extends NormalParticle
{
	public void show()
	{
		ellipse((float)x, (float)y, 30, 30);
	}

}
