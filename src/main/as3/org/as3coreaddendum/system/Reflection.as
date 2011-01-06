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
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;

	/**
	 * Provides a very basic reflection API.
	 * <p>This is a static class and shouldn't be instantiated.</p>
	 * 
	 * @example
	 * 
	 * <b>getClassName()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getClassName(str)                 // String
	 * Reflection.getClassName(String)              // String
	 *   
	 * Reflection.getClassName(s)                   // Sprite
	 * Reflection.getClassName(Sprite)              // Sprite
	 * 
	 * Reflection.getClassName(n)                   // NumberComparator
	 * Reflection.getClassName(NumberComparator)    // NumberComparator
	 * </listing>
	 * 
	 * <b>getClassPackage()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getClassPackage(str)                 // null
	 * Reflection.getClassPackage(String)              // null
	 *   
	 * Reflection.getClassPackage(s)                   // flash.display
	 * Reflection.getClassPackage(Sprite)              // flash.display
	 * 
	 * Reflection.getClassPackage(n)                   // org.as3coreaddendum.system.comparators
	 * Reflection.getClassPackage(NumberComparator)    // org.as3coreaddendum.system.comparators
	 * </listing>
	 * 
	 * <b>getClassPath()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getClassPath(str)                 // String
	 * Reflection.getClassPath(String)              // String
	 *   
	 * Reflection.getClassPath(s)                   // flash.display.Sprite
	 * Reflection.getClassPath(Sprite)              // flash.display.Sprite
	 * 
	 * Reflection.getClassPath(n)                   // org.as3coreaddendum.system.comparators.NumberComparator
	 * Reflection.getClassPath(NumberComparator)    // org.as3coreaddendum.system.comparators.NumberComparator
	 * </listing>
	 * 
	 * <b>getSuperClassName()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getSuperClassName(str)                 // Object
	 * Reflection.getSuperClassName(String)              // Object
	 *   
	 * Reflection.getSuperClassName(s)                   // DisplayObjectContainer
	 * Reflection.getSuperClassName(Sprite)              // DisplayObjectContainer
	 * 
	 * Reflection.getSuperClassName(n)                   // Object
	 * Reflection.getSuperClassName(NumberComparator)    // Object
	 * </listing>
	 * 
	 * <b>getSuperClassPackage()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getSuperClassPackage(str)                 // null
	 * Reflection.getSuperClassPackage(String)              // null
	 *   
	 * Reflection.getSuperClassPackage(s)                   // flash.display
	 * Reflection.getSuperClassPackage(Sprite)              // flash.display
	 * 
	 * Reflection.getSuperClassPackage(n)                   // null
	 * Reflection.getSuperClassPackage(NumberComparator)    // null
	 * </listing>
	 * 
	 * <b>getSuperClassPath()</b>
	 * <listing version="3.0">
	 * import flash.display.Sprite;
	 * import org.as3coreaddendum.system.Reflection;
	 * import org.as3coreaddendum.system.comparators.NumberComparator;
	 * 
	 * var str  :String             = "";
	 * var s    :Sprite             = new Sprite();
	 * var n    :NumberComparator   = new NumberComparator();
	 *
	 * Reflection.getSuperClassPath(str)                 // Object
	 * Reflection.getSuperClassPath(String)              // Object
	 *   
	 * Reflection.getSuperClassPath(s)                   // flash.display.DisplayObjectContainer
	 * Reflection.getSuperClassPath(Sprite)              // flash.display.DisplayObjectContainer
	 * 
	 * Reflection.getSuperClassPath(n)                   // Object
	 * Reflection.getSuperClassPath(NumberComparator)    // Object
	 * </listing>
	 * 
	 * @author Flávio Silva
	 */
	public final class Reflection
	{
		/**
		 * Reflection is a static class and shouldn't be instantiated.
		 * 
		 * @throws 	IllegalOperationError 	Reflection is a static class and shouldn't be instantiated.
		 */
		public function Reflection()
		{
			throw new IllegalOperationError("Reflection is a static class and shouldn't be instantiated.");
		}

		/**
		 * Retrieves the class name of the target instance or type (Class).
		 * 
		 * @param 	o 	The target instance or type (Class).
		 * @return 	The class name of the target instance or type (Class).
		 */
		public static function getClassName(o:*): String
		{
			var path:String = getClassPath(o);
			var a:Array = path.split(".");
			return (a.length > 0) ? a.pop() : path;
		}

		/**
		 * Retrieves the class package of the target instance or type (Class).
		 * 
		 * @param 	o	The target instance or type (Class).
		 * @return	The package string representation of the target instance or type (Class).
		 */
		public static function getClassPackage(o:*): String
		{
			var path:String = getClassPath(o);
			var a:Array = path.split(".");
			
			if (a.length > 1)
			{
				a.pop();
				return a.join(".");
			}
			
			return null;
		}

		/**
		 * Retrieves the full qualified class name of the target instance or type (Class).
		 * 
		 * @param 	o	The target instance or type (Class).
		 * @return	The full qualified class name string representation (package + name) of the target instance or type (Class).
		 */
		public static function getClassPath(o:*): String
		{
			var path:String = getQualifiedClassName(o);
			return path.split("::").join(".");
		}

		/**
		 * Retrieves the super class name of the target instance or type (Class).
		 * 
		 * @param 	o	The target instance or type (Class).
		 * @return 	The super class name of the target instance or type (Class).
		 */
		public static function getSuperClassName(o:*): String
		{
			var path:String = getSuperClassPath(o);
			var a:Array = path.split(".");
			return (a.length > 0) ? a.pop() : path;
		}

		/**
		 * Retrieves the super class package of the target instance or type (Class).
		 * 
		 * @param 	o	The target instance or type (Class).
		 * @return	The package string representation of the target instance or type (Class).
		 */
		public static function getSuperClassPackage(o:*): String
		{
			var path:String = getSuperClassPath(o);
			var a:Array = path.split(".");
			
			if (a.length > 1)
			{
				a.pop();
				return a.join(".");
			}
			
			return null;
		}

		/**
		 * Retrieves the full qualified class name of the super class of the target instance or type (Class).
		 * 
		 * @param 	o	The target instance or type (Class).
		 * @return	The full qualified class name string representation (package + name) of the super class of the target instance or type (Class).
		 */
		public static function getSuperClassPath(o:*): String
		{
			var path:String = getQualifiedSuperclassName(o);
			return path.split("::").join(".");
		}

	}

}