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

package org.as3coreaddendum.system {
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class NumericRoundingTests
	{
		
		public function NumericRoundingTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="flash.errors.IllegalOperationError")]
		public function constructor_illegalInstanciation_ThrowsError(): void
		{
			var enum:NumericRounding = new NumericRounding("test", 1);
			enum = null;
		}
		
		///////////////////////////////////////
		// NumericRounding.compareTo() TESTS //
		///////////////////////////////////////
		
		[Test]
		public function compareTo_validNoneNoneComparation_ReturnsInteger(): void
		{
			var result:int = NumericRounding.NONE.compareTo(NumericRounding.NONE);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compareTo_validNoneFloorComparation_ReturnsInteger(): void
		{
			var result:int = NumericRounding.NONE.compareTo(NumericRounding.FLOOR);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compareTo_validFloorCeilComparation_ReturnsInteger(): void
		{
			var result:int = NumericRounding.FLOOR.compareTo(NumericRounding.CEIL);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compareTo_validRoundFloorComparation_ReturnsInteger(): void
		{
			var result:int = NumericRounding.ROUND.compareTo(NumericRounding.FLOOR);
			Assert.assertEquals(1, result);
		}
		
		////////////////////////////////////
		// NumericRounding.equals() TESTS //
		////////////////////////////////////
		
		[Test]
		public function equals_validNoneNoneEquality_ReturnsTrue(): void
		{
			var result:Boolean = NumericRounding.NONE.equals(NumericRounding.NONE);
			Assert.assertEquals(true, result);
		}
		
		[Test]
		public function equals_validFloorNoneEquality_ReturnsFalse(): void
		{
			var result:Boolean = NumericRounding.FLOOR.equals(NumericRounding.NONE);
			Assert.assertEquals(false, result);
		}
		
		//////////////////////////////////////
		// NumericRounding.toSource() TESTS //
		//////////////////////////////////////
		
		[Test]
		public function toSource_validMethodCall_ReturnsStringWithToSource(): void
		{
			var result:String = NumericRounding.NONE.toSource();
			Assert.assertEquals("NumericRounding.None", result);
		}
		
		//////////////////////////////////////
		// NumericRounding.toString() TESTS //
		//////////////////////////////////////
		
		[Test]
		public function toString_validMethodCall_ReturnsStringWithName(): void
		{
			var result:String = NumericRounding.FLOOR.toString();
			Assert.assertEquals("Floor", result);
		}
		
		/////////////////////////////////////
		// NumericRounding.valueOf() TESTS //
		/////////////////////////////////////
		
		[Test]
		public function valueOf_validMethodCall_ReturnsInt(): void
		{
			var result:int = NumericRounding.ROUND.valueOf();
			Assert.assertEquals(2, result);
		}
		
	}

}