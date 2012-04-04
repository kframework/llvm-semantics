; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000706-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32, i32, i32 }

define void @bar(%struct.baz* %x, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j) nounwind uwtable {
entry:
  %x.addr = alloca %struct.baz*, align 8
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  store %struct.baz* %x, %struct.baz** %x.addr, align 8
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load %struct.baz** %x.addr, align 8
  %a = getelementptr inbounds %struct.baz* %0, i32 0, i32 0
  %1 = load i32* %a, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.baz** %x.addr, align 8
  %b = getelementptr inbounds %struct.baz* %2, i32 0, i32 1
  %3 = load i32* %b, align 4
  %cmp1 = icmp ne i32 %3, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load %struct.baz** %x.addr, align 8
  %c = getelementptr inbounds %struct.baz* %4, i32 0, i32 2
  %5 = load i32* %c, align 4
  %cmp3 = icmp ne i32 %5, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %6 = load %struct.baz** %x.addr, align 8
  %d = getelementptr inbounds %struct.baz* %6, i32 0, i32 3
  %7 = load i32* %d, align 4
  %cmp5 = icmp ne i32 %7, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %8 = load %struct.baz** %x.addr, align 8
  %e = getelementptr inbounds %struct.baz* %8, i32 0, i32 4
  %9 = load i32* %e, align 4
  %cmp7 = icmp ne i32 %9, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %10 = load i32* %f.addr, align 4
  %cmp9 = icmp ne i32 %10, 6
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %11 = load i32* %g.addr, align 4
  %cmp11 = icmp ne i32 %11, 7
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false10
  %12 = load i32* %h.addr, align 4
  %cmp13 = icmp ne i32 %12, 8
  br i1 %cmp13, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %13 = load i32* %i.addr, align 4
  %cmp15 = icmp ne i32 %13, 9
  br i1 %cmp15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false14
  %14 = load i32* %j.addr, align 4
  %cmp17 = icmp ne i32 %14, 10
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false16, %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false16
  ret void
}

declare void @abort() noreturn

define void @foo(i8* %z, %struct.baz* byval align 8 %x, i8* %y) nounwind uwtable {
entry:
  %z.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  store i8* %z, i8** %z.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  call void @bar(%struct.baz* %x, i32 6, i32 7, i32 8, i32 9, i32 10)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.baz, align 8
  store i32 0, i32* %retval
  %a = getelementptr inbounds %struct.baz* %x, i32 0, i32 0
  store i32 1, i32* %a, align 4
  %b = getelementptr inbounds %struct.baz* %x, i32 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.baz* %x, i32 0, i32 2
  store i32 3, i32* %c, align 4
  %d = getelementptr inbounds %struct.baz* %x, i32 0, i32 3
  store i32 4, i32* %d, align 4
  %e = getelementptr inbounds %struct.baz* %x, i32 0, i32 4
  store i32 5, i32* %e, align 4
  call void @foo(i8* null, %struct.baz* byval align 8 %x, i8* null)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
