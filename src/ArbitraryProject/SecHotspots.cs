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

        public bool IsLetter(string input)
        {
            return Regex.IsMatch(input, "[a-zA-Z]");
        }
    }
}
