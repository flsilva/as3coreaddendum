/*
 * Licensed under the MIT License
 * 
 * Copyright 2010 (c) Flávio Silva, http://flsilva.com
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * http://www.opensource.org/licenses/mit-license.php
 */

package org.as3coreaddendum.system.comparators {
	import org.as3coreaddendum.system.StringCase;
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class StringComparatorTests
	{
		
		public function StringComparatorTests()
		{
			
		}
		
		/////////////////////////////////////////////////
		// StringComparatorTests(StringCase.SENSITIVE).compare() TESTS //
		/////////////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgument1_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			comparator.compare("a", null);
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgument2_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			comparator.compare(null, "a");
		}
		
		[Test]
		public function compare_caseSensitiveComparison1_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("a", "a");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison2_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("a", "A");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison3_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("A", "a");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison4_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("A", "A");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison5_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("a", "b");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison6_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("b", "a");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison7_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("abc", "abc");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison8_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("abc", "abcd");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison9_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("abcd", "abc");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison10_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("abc", "abC");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison11_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("aBc", "abC");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison12_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("aBcd", "abC");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveComparison13_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:int = comparator.compare("aBc", "abCd");
			Assert.assertEquals(-1, result);
		}
		
		/////////////////////////////////////////////////
		// StringComparatorTests(false).compare() TESTS //
		/////////////////////////////////////////////////
		
		[Test]
		public function compare_caseInsensitiveComparison1_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.INSENSITIVE);
			var result:int = comparator.compare("a", "A");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseInsensitiveComparison2_ReturnsInteger(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.INSENSITIVE);
			var result:int = comparator.compare("aBc", "abC");
			Assert.assertEquals(0, result);
		}
		
		/////////////////////////////////////////
		// StringComparator().toString() TESTS //
		/////////////////////////////////////////
		
		[Test]
		public function toString_simpleCall1_ReturnsString(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.SENSITIVE);
			var result:String = comparator.toString();
			Assert.assertEquals("[StringComparator: stringCase = Sensitive]", result);
		}
		
		[Test]
		public function toString_simpleCall2_ReturnsString(): void
		{
			var comparator:StringComparator = new StringComparator(StringCase.INSENSITIVE);
			var result:String = comparator.toString();
			Assert.assertEquals("[StringComparator: stringCase = Insensitive]", result);
		}
		
	}

}