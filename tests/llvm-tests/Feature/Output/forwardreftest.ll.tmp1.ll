; ModuleID = '<stdin>'

declare void @F(i32 (i32)*, i32 (i32)*, i32 (i32)*)

define i32 @zarro(i32 %Func) {
Startup:
  %0 = add i32 0, 10
  ret i32 0
}

define i32 @test(i32) {
  call void @F(i32 (i32)* @zarro, i32 (i32)* @test, i32 (i32)* @foozball)
  ret i32 0
}

define i32 @foozball(i32) {
  ret i32 0
}
