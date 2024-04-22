using System.Text.RegularExpressions;

namespace ArbitraryProject
{
    public class SecHotspots
    {
        private const string Regexp = "\\(([^)]+)\\)";

        public bool IsDigit(string input)
        {
            return Regex.IsMatch(input, "\\d");
        }
    }
}
