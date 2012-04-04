; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080719-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cfb_tab8_be = internal constant [16 x i32] [i32 0, i32 255, i32 65280, i32 65535, i32 16711680, i32 16711935, i32 16776960, i32 16777215, i32 -16777216, i32 -16776961, i32 -16711936, i32 -16711681, i32 -65536, i32 -65281, i32 -256, i32 -1], align 16
@cfb_tab16_be = internal constant [4 x i32] [i32 0, i32 65535, i32 -65536, i32 -1], align 16
@cfb_tab32 = internal constant [2 x i32] [i32 0, i32 -1], align 4

define i32* @xxx(i32 %bpp) nounwind uwtable {
entry:
  %bpp.addr = alloca i32, align 4
  %tab = alloca i32*, align 8
  store i32 %bpp, i32* %bpp.addr, align 4
  %0 = load i32* %bpp.addr, align 4
  switch i32 %0, label %sw.default [
    i32 8, label %sw.bb
    i32 16, label %sw.bb1
    i32 32, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32* getelementptr inbounds ([16 x i32]* @cfb_tab8_be, i32 0, i32 0), i32** %tab, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i32* getelementptr inbounds ([4 x i32]* @cfb_tab16_be, i32 0, i32 0), i32** %tab, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  br label %sw.default

sw.default:                                       ; preds = %entry, %sw.bb2
  store i32* getelementptr inbounds ([2 x i32]* @cfb_tab32, i32 0, i32 0), i32** %tab, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  %1 = load i32** %tab, align 8
  ret i32* %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32*, align 8
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32* @xxx(i32 8)
  store i32* %call, i32** %a, align 8
  %0 = load i32** %a, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 0
  %1 = load i32* %arrayidx, align 4
  store i32 %1, i32* %b, align 4
  %2 = load i32* %b, align 4
  %3 = load i32* getelementptr inbounds ([16 x i32]* @cfb_tab8_be, i32 0, i64 0), align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
