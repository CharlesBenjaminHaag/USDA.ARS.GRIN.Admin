using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace USDA.ARS.GRIN.Utilities
{
    public static class TextUtility
    {
        public static string ToProperCase(this string input)
        {
            if (IsAllUpperOrAllLower(input))
            {
                // fix the ALL UPPERCASE or all lowercase names
                return string.Join(" ", input.Split(' ').Select(word => wordToProperCase(word)));
            }
            else
            {
                // leave the CamelCase or Propercase names alone
                return input;
            }
        }

        public static bool IsAllUpperOrAllLower(this string input)
        {
            return (input.ToLower().Equals(input) || input.ToUpper().Equals(input));
        }

        private static string wordToProperCase(string word)
        {
            if (string.IsNullOrEmpty(word)) return word;

            // Standard case
            string ret = capitaliseFirstLetter(word);

            // Special cases:
            ret = properSuffix(ret, "'");   // D'Artagnon, D'Silva
            ret = properSuffix(ret, ".");   // ???
            ret = properSuffix(ret, "-");       // Oscar-Meyer-Weiner
            ret = properSuffix(ret, "Mc", t => t.Length > 4);      // Scots
            ret = properSuffix(ret, "Mac", t => t.Length > 5);     // Scots except Macey

            // Special words:
            ret = specialWords(ret, "van");     // Dick van Dyke
            ret = specialWords(ret, "von");     // Baron von Bruin-Valt
            ret = specialWords(ret, "de");
            ret = specialWords(ret, "di");
            ret = specialWords(ret, "da");      // Leonardo da Vinci, Eduardo da Silva
            ret = specialWords(ret, "of");      // The Grand Old Duke of York
            ret = specialWords(ret, "the");     // William the Conqueror
            ret = specialWords(ret, "HRH");     // His/Her Royal Highness
            ret = specialWords(ret, "HRM");     // His/Her Royal Majesty
            ret = specialWords(ret, "H.R.H.");  // His/Her Royal Highness
            ret = specialWords(ret, "H.R.M.");  // His/Her Royal Majesty

            ret = dealWithRomanNumerals(ret);   // William Gates, III

            return ret;
        }

        private static string properSuffix(string word, string prefix, Func<string, bool> condition = null)
        {
            if (string.IsNullOrEmpty(word)) return word;
            if (condition != null && !condition(word)) return word;

            string lowerWord = word.ToLower();
            string lowerPrefix = prefix.ToLower();

            if (!lowerWord.Contains(lowerPrefix)) return word;

            int index = lowerWord.IndexOf(lowerPrefix);

            // If the search string is at the end of the word ignore.
            if (index + prefix.Length == word.Length) return word;

            return word.Substring(0, index) + prefix +
                capitaliseFirstLetter(word.Substring(index + prefix.Length));
        }

        private static string specialWords(string word, string specialWord)
        {
            if (word.Equals(specialWord, StringComparison.InvariantCultureIgnoreCase))
            {
                return specialWord;
            }
            else
            {
                return word;
            }
        }

        private static string dealWithRomanNumerals(string word)
        {
            return new Regex(@"\b(?!Xi\b)(X|XX|XXX|XL|L|LX|LXX|LXXX|XC|C)?(I|II|III|IV|V|VI|VII|VIII|IX)?\b", RegexOptions.IgnoreCase).Replace(word, match => match.Value.ToUpperInvariant());
        }

        private static string capitaliseFirstLetter(string word)
        {
            return char.ToUpper(word[0]) + word.Substring(1).ToLower();
        }

    }
}