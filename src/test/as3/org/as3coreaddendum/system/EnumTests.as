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

package org.as3coreaddendum.system
{
	import org.flexunit.Assert;

	/**
	 * @author Flávio Silva
	 */
	public class EnumTests
	{
		
		public function EnumTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test(expects="flash.errors.IllegalOperationError")]
		public function constructor_illegalInstanciation1_ThrowsError(): void
		{
			var enum:Enum = new Enum("test", 1);
			enum = null;
		}
		
		[Test(expects="flash.errors.IllegalOperationError")]
		public function constructor_illegalInstanciation2_ThrowsError(): void
		{
			var enum:TestEnum = new TestEnum("test", 1);
			enum = null;
		}
		
		////////////////////////////
		// Enum.compareTo() TESTS //
		////////////////////////////
		
		[Test]
		public function compareTo_validNoneNoneComparation_ReturnsInteger(): void
		{
			var result:int = TestEnum.T1.compareTo(TestEnum.T1);
			Assert.assertEquals(0, result);
		}
		
		[Test]
		public function compareTo_validNoneFloorComparation_ReturnsInteger(): void
		{
			var result:int = TestEnum.T1.compareTo(TestEnum.T2);
			Assert.assertEquals(-1, result);
		}
		
		[Test]
		public function compareTo_validNoneRoundComparation_ReturnsInteger(): void
		{
			var result:int = TestEnum.T2.compareTo(TestEnum.T1);
			Assert.assertEquals(1, result);
		}
		
		/////////////////////////
		// Enum.equals() TESTS //
		/////////////////////////
		
		[Test]
		public function equals_validNoneNoneEquality_ReturnsTrue(): void
		{
			var result:Boolean = TestEnum.T1.equals(TestEnum.T1);
			Assert.assertEquals(true, result);
		}
		
		[Test]
		public function equals_validNoneFloorEquality_ReturnsFalse(): void
		{
			var result:Boolean = TestEnum.T1.equals(TestEnum.T2);
			Assert.assertEquals(false, result);
		}
		
		///////////////////////////
		// Enum.toSource() TESTS //
		///////////////////////////
		
		[Test]
		public function toSource_validMethodCall_ReturnsStringWithToSource(): void
		{
			var result:String = TestEnum.T1.toSource();
			Assert.assertEquals("TestEnum.T1", result);
		}
		
		///////////////////////////
		// Enum.toString() TESTS //
		///////////////////////////
		
		[Test]
		public function toString_validMethodCall_ReturnsStringWithName(): void
		{
			var result:String = TestEnum.T2.toString();
			Assert.assertEquals("T2", result);
		}
		
		//////////////////////////
		// Enum.valueOf() TESTS //
		//////////////////////////
		
		[Test]
		public function valueOf_validMethodCall_ReturnsInt(): void
		{
			var result:int = TestEnum.T1.valueOf();
			Assert.assertEquals(0, result);
		}
		
	}
}

import org.as3coreaddendum.system.Enum;

import flash.errors.IllegalOperationError;

class TestEnum extends Enum
{
	
	public static const T1	: TestEnum = new TestEnum("T1", 0);
	
	public static const T2	: TestEnum = new TestEnum("T2", 1);

	private static var _created :Boolean = false;
	
	{
		_created = true;
	}

	public function TestEnum(name:String, ordinal:int)
	{
		super(name, ordinal);
		if (_created) throw new IllegalOperationError("The set of acceptable values by this Enumerated Type has already been created internally.");
	}

}