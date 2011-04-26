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
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class AlphabeticalComparatorTests
	{
		
		public function AlphabeticalComparatorTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="ArgumentError")]
		public function constructor_invalidArgument_ThrowsError(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(null);
			comparator = null;
		}
		
		///////////////////////////////////////////
		// AlphabeticComparator.comparison TESTS //
		///////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function comparison_invalidArgument_ThrowsError(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			comparator.comparison = null;
		}
		
		/////////////////////////////////////////////////////////////////////////////////
		// AlphabeticComparator(AlphabeticComparison.LOWER_CASE_FIRST).compare() TESTS //
		/////////////////////////////////////////////////////////////////////////////////
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgument1_ThrowsError(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			comparator.compare("a", null);
		}
		
		[Test(expects="ArgumentError")]
		public function compare_invalidArgument2_ThrowsError(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			comparator.compare(null, "a");
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison1_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("a", "a");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison2_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("a", "b");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison3_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("b", "a");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison4_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("A", "a");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison5_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("a", "A");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison6_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("comparison", "comparison");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison7_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("comparison", "comParison");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison8_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("comParison", "comparison");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison9_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("compariso", "comparison");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveLowerFirstComparison10_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:int = comparator.compare("comparison", "compariso");
			Assert.assertEquals(1, result);
		}
		
		/////////////////////////////////////////////////////////////////////////////////////
		// AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST).compare() TESTS //
		/////////////////////////////////////////////////////////////////////////////////////
		
		[Test]
		public function compare_caseSensitiveUpperFirstComparison1_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST);
			var result:int = comparator.compare("A", "a");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveUpperFirstComparison2_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST);
			var result:int = comparator.compare("a", "A");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveUpperFirstComparison3_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST);
			var result:int = comparator.compare("comparison", "comParison");
			Assert.assertEquals(1, result);
		}
		
		[Test]
		public function compare_caseSensitiveUpperFirstComparison4_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST);
			var result:int = comparator.compare("comParison", "comparison");
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compare_caseSensitiveUpperFirstComparison5_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.UPPER_CASE_FIRST);
			var result:int = comparator.compare("Comparison", "compariso");
			Assert.assertEquals(-1, result);
		}
		
		/////////////////////////////////////////////////////////////////////////////////////
		// AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE).compare() TESTS //
		/////////////////////////////////////////////////////////////////////////////////////
		
		[Test]
		public function compare_caseInsensitiveLowerFirstComparison1_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:int = comparator.compare("A", "a");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseInsensitiveLowerFirstComparison2_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:int = comparator.compare("a", "A");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseInsensitiveLowerFirstComparison3_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:int = comparator.compare("comparison", "comParison");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseInsensitiveLowerFirstComparison4_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:int = comparator.compare("comParison", "comparison");
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compare_caseInsensitiveLowerFirstComparison5_ReturnsInteger(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:int = comparator.compare("comparison", "Compariso");
			Assert.assertEquals(1, result);
		}
		
		/////////////////////////////////////////////////////////////////////////////////////
		// AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE).compare() TESTS //
		/////////////////////////////////////////////////////////////////////////////////////
		
		[Test]
		public function toString_simpleCall1_ReturnsString(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.LOWER_CASE_FIRST);
			var result:String = comparator.toString();
			Assert.assertEquals("[AlphabeticComparator: comparison = Lower Case First]", result);
		}
		
		[Test]
		public function toString_simpleCall2_ReturnsString(): void
		{
			var comparator:AlphabeticalComparator = new AlphabeticalComparator(AlphabeticalComparison.CASE_INSENSITIVE);
			var result:String = comparator.toString();
			Assert.assertEquals("[AlphabeticComparator: comparison = Case Insensitive]", result);
		}
		
	}

}