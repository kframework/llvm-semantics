target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define internal void @throw(i1 %ShouldThrow) {
	br i1 %ShouldThrow, label %Throw, label %NoThrow

Throw:
        ret void

NoThrow:
        ret void
}

define i32 @main() {
  invoke void @throw(i1 1)
			to label %Cont unwind label %Abort

Cont:
  %1 = add i32 1, 1
  ret i32 %1

Abort:
  %info = landingpad { i8*, i32 } cleanup
  resume { i8*, i32 } %info

}
