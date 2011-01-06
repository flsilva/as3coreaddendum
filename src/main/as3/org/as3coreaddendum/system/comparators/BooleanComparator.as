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

package org.as3coreaddendum.system.comparators
{
	import org.as3coreaddendum.errors.ClassCastError;
	import org.as3coreaddendum.system.IComparator;

	/**
	 * A comparator for <code>Boolean</code> objects.
	 * 
	 * @example
	 * 
	 * <listing version="3.0">
	 * import org.as3coreaddendum.system.comparators.BooleanComparator;
	 * 
	 * var b1:BooleanComparator = new BooleanComparator();
	 * 
	 * b1.compare(true, false);    // -1
	 * b1.compare(false, true);    // 1
	 * 
	 * var b2:BooleanComparator = new BooleanComparator(false);
	 * 
	 * b2.compare(true, false);    // 1
	 * b2.compare(false, true);    // -1
	 * </listing>
	 * 
	 * @author Flávio Silva
	 */
	public class BooleanComparator implements IComparator
	{
		private var _trueFirst: Boolean;

		/**
		 * Defines if treat <code>true</code> values as lower (first) or higher than <code>false</code>.
		 */
		public function get trueFirst(): Boolean { return _trueFirst; }

		public function set trueFirst(value:Boolean): void { _trueFirst = value; }

		/**
		 * Constructor, creates a new <code>BooleanComparator</code> object.
		 * 
		 * @param trueFirst 	Defines if treat <code>true</code> values as lower (first) or higher than <code>false</code>.
		 */
		public function BooleanComparator(trueFirst:Boolean = true)
		{
			_trueFirst = trueFirst;
		}

		/**
		 * Performs the comparison between the two arguments.
		 * 
		 * @param 	o1 	The first <code>Boolean</code> object to be compared.
		 * @param 	o2 	The second <code>Boolean</code> object to be compared.
		 * @throws 	org.as3coreaddendum.errors.ClassCastError 	if any of the arguments are not of type <code>Boolean</code>.
		 * @return 	A negative integer, zero, or a positive integer as the first argument is less than, equal to, or greater than the second.
		 */
		public function compare(o1:*, o2:*): int
		{
			if (!(o1 is Boolean) || !(o2 is Boolean)) throw new ClassCastError("Both arguments must be of type 'Boolean'.");
			
			if (o1 == o2)
			{
				return 0;
			}
			else if (o1 == true && o2 == false)
			{
				return _trueFirst ? -1 : 1;
			}
			else
			{
				return _trueFirst ? 1 : -1;
			}
		}

		/**
		 * Returns the string representation of this object.
		 * 
		 * @return 	the string representation of the this object.
		 */
		public function toString():String
		{
			return "[BooleanComparator: trueFirst = " + _trueFirst + "]";
		}

	}

}