; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000706-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load %struct.baz** %x.addr, align 8
  %a = getelementptr inbounds %struct.baz* %tmp, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.baz** %x.addr, align 8
  %b = getelementptr inbounds %struct.baz* %tmp2, i32 0, i32 1
  %tmp3 = load i32* %b, align 4
  %cmp4 = icmp ne i32 %tmp3, 2
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load %struct.baz** %x.addr, align 8
  %c = getelementptr inbounds %struct.baz* %tmp6, i32 0, i32 2
  %tmp7 = load i32* %c, align 4
  %cmp8 = icmp ne i32 %tmp7, 3
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %tmp10 = load %struct.baz** %x.addr, align 8
  %d = getelementptr inbounds %struct.baz* %tmp10, i32 0, i32 3
  %tmp11 = load i32* %d, align 4
  %cmp12 = icmp ne i32 %tmp11, 4
  br i1 %cmp12, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %tmp14 = load %struct.baz** %x.addr, align 8
  %e = getelementptr inbounds %struct.baz* %tmp14, i32 0, i32 4
  %tmp15 = load i32* %e, align 4
  %cmp16 = icmp ne i32 %tmp15, 5
  br i1 %cmp16, label %if.then, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %lor.lhs.false13
  %tmp18 = load i32* %f.addr, align 4
  %cmp19 = icmp ne i32 %tmp18, 6
  br i1 %cmp19, label %if.then, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false17
  %tmp21 = load i32* %g.addr, align 4
  %cmp22 = icmp ne i32 %tmp21, 7
  br i1 %cmp22, label %if.then, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %tmp24 = load i32* %h.addr, align 4
  %cmp25 = icmp ne i32 %tmp24, 8
  br i1 %cmp25, label %if.then, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %tmp27 = load i32* %i.addr, align 4
  %cmp28 = icmp ne i32 %tmp27, 9
  br i1 %cmp28, label %if.then, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %tmp30 = load i32* %j.addr, align 4
  %cmp31 = icmp ne i32 %tmp30, 10
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false17, %lor.lhs.false13, %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false29
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
  %x = alloca %struct.baz, align 4
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
