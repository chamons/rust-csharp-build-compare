using NUnit.Framework;
using System;
namespace test
{
	[TestFixture ()]
	public class Test
	{
		[Test ()]
		public void Add ()
		{
			Assert.AreEqual (6, library.MyClass.AddTwo (4));
		}
	}
}
