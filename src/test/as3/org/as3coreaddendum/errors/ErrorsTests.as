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

package org.as3coreaddendum.errors {

	/**
	 * @author Flávio Silva
	 */
	public class ErrorsTests
	{
		
		public function ErrorsTests()
		{
			
		}
		
		///////////////////////
		// CONSTRUCTOR TESTS //
		///////////////////////
		
		[Test]
		public function constructor_validInstantiationClassCastError_Void(): void
		{
			var error:ClassCastError = new ClassCastError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationCloneNotSupportedError_Void(): void
		{
			var error:CloneNotSupportedError = new CloneNotSupportedError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationIllegalStateError_Void(): void
		{
			var error:IllegalStateError = new IllegalStateError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationInvalidEnumArgumentError_Void(): void
		{
			var error:InvalidEnumArgumentError = new InvalidEnumArgumentError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationNullPointerError_Void(): void
		{
			var error:NullPointerError = new NullPointerError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationObjectDisposedError_Void(): void
		{
			var error:ObjectDisposedError = new ObjectDisposedError();
			error = null;
		}
		
		[Test]
		public function constructor_validInstantiationUnsupportedOperationError_Void(): void
		{
			var error:UnsupportedOperationError = new UnsupportedOperationError();
			error = null;
		}
		
	}

}