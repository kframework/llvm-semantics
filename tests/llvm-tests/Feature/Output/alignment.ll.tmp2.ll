; ModuleID = '<stdin>'

@X = global i32 4, align 16

define i32* @test() align 32 {
  %X = alloca i32, align 4
  %Y = alloca i32, i32 42, align 16
  %Z = alloca i32
  ret i32* %X
}

define void @test3() alignstack(16) {
  ret void
}
