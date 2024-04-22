namespace ArbitraryProject.Tests
{
    public class SecHotspotsTests
    {
        [Fact]
        public void IsDigit_ForDigitString_ReturnsTrue()
        {
            var secHotspots = new SecHotspots();

            var result = secHotspots.IsDigit("1");

            Assert.True(result);
        }
    }
}