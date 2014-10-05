package sketchproject.objects.particle
{
	import sketchproject.core.Assets;
	
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	
	public class Firework extends PDParticleSystem
	{
		public function Firework()
		{
			super(XML(new Assets.ParticleFireworksXML()), Assets.getTexture("ParticleFireworks"));
		}
	}
}