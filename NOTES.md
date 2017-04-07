Pony
====

* Pony has:
    * Actors
    * Static typing
    * No global variables
    * No NULL
    * No unhandled exceptions
    * Capabilities
    * No inheritance (except traits, which are like Ruby mixins)
* Capabilities:
    * box (the default) - the object is readable, but not writeable
    * ref - the object is mutable
* Actors are like classes, but with behaviors that are asynchronous methods.
* Programs always start with the `create` constructor (that takes an `Env`) of the `Main` actor.
* Constructors are prefixed with the `new` keyword.
* Constructors have names; the default is `create`.
* A finalizer (always `fun _final()`) is run before an object is garbage collected.
* Method calls must have parentheses.
* Methods and fields are in the same namespace.
* They use "method" to mean function, constructor, or behavior.
* Types (and only types) start with a capital letter.
    * Types include classes, actors, traits, interfaces, primitives, and type aliases.
* A primitive is like a class, but has no fields, and only one instance.
    * Can be used like a Ruby symbol.
    * Can be used as values in an enumeration type.
    * Can be used like a Ruby module (but without mixin capabilities) to group functions together.
* Built-in primitive types:
    * Bool (either true or false)
    * ISize, ILong, I8, I16, I32, I64, I128, and U (unsigned) variants
    * F32, F64
* Primitives have initializers and finalizers.
    * `_init` is called before any actors start.
    * `_final` is called after all actors have terminated.
* The resulting value of an assignment is the (previous value of the) *left hand* of the equal sign.
    * It's called a destructive read, and has to do with capabilities.
    * So you can do `a = b = a` to swap `a` and `b`.
* Can think of behaviors as the Command of (CQS) Command-Query Separation.n
* Basic program:
~~~ pony
actor Main
  let x: U64 = 1
  new create(env: Env) =>
    let x: U64 = 1
    env.out.print("Hello, world!")
~~~
