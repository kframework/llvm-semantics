; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020307-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f3(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 6
  %cmp = icmp ugt i64 %and, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f4(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 14
  %cmp = icmp ugt i64 %and, 9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f5(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 30
  %cmp = icmp ugt i64 %and, 17
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f6(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 62
  %cmp = icmp ugt i64 %and, 33
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f7(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 126
  %cmp = icmp ugt i64 %and, 65
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f8(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 254
  %cmp = icmp ugt i64 %and, 129
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f9(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 510
  %cmp = icmp ugt i64 %and, 257
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f10(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 1022
  %cmp = icmp ugt i64 %and, 513
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f11(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 2046
  %cmp = icmp ugt i64 %and, 1025
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f12(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 4094
  %cmp = icmp ugt i64 %and, 2049
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f13(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 8190
  %cmp = icmp ugt i64 %and, 4097
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f14(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 16382
  %cmp = icmp ugt i64 %and, 8193
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f15(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 32766
  %cmp = icmp ugt i64 %and, 16385
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f16(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 65534
  %cmp = icmp ugt i64 %and, 32769
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f17(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 131070
  %cmp = icmp ugt i64 %and, 65537
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f18(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 262142
  %cmp = icmp ugt i64 %and, 131073
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f19(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 524286
  %cmp = icmp ugt i64 %and, 262145
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f20(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 1048574
  %cmp = icmp ugt i64 %and, 524289
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f21(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 2097150
  %cmp = icmp ugt i64 %and, 1048577
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f22(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 4194302
  %cmp = icmp ugt i64 %and, 2097153
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f23(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 8388606
  %cmp = icmp ugt i64 %and, 4194305
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f24(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 16777214
  %cmp = icmp ugt i64 %and, 8388609
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f25(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 33554430
  %cmp = icmp ugt i64 %and, 16777217
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f26(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 67108862
  %cmp = icmp ugt i64 %and, 33554433
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f27(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 134217726
  %cmp = icmp ugt i64 %and, 67108865
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f28(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 268435454
  %cmp = icmp ugt i64 %and, 134217729
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f29(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 536870910
  %cmp = icmp ugt i64 %and, 268435457
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f30(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 1073741822
  %cmp = icmp ugt i64 %and, 536870913
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f31(i64 %j) nounwind uwtable {
entry:
  %and = and i64 %j, 2147483646
  %cmp = icmp ugt i64 %and, 1073741825
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
