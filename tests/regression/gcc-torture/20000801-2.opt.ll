; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000801-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { %struct.foo* }

define %struct.foo* @test(%struct.foo* %node) nounwind uwtable readonly {
entry:
  %tobool1 = icmp eq %struct.foo* %node, null
  br i1 %tobool1, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %storemerge2 = phi %struct.foo* [ %tmp5, %while.body ], [ %node, %entry ]
  %next = getelementptr inbounds %struct.foo* %storemerge2, i64 0, i32 0
  %tmp5 = load %struct.foo** %next, align 8
  %tobool = icmp eq %struct.foo* %tmp5, null
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret %struct.foo* null
}

define i32 @bar() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @baz() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %b = alloca %struct.foo, align 8
  %next1 = getelementptr inbounds %struct.foo* %b, i64 0, i32 0
  store %struct.foo* null, %struct.foo** %next1, align 8
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.while.body.i_crit_edge, %entry
  %tmp5.i = phi %struct.foo* [ %tmp5.i.pre, %while.body.i.while.body.i_crit_edge ], [ %b, %entry ]
  %tobool.i = icmp eq %struct.foo* %tmp5.i, null
  br i1 %tobool.i, label %if.end, label %while.body.i.while.body.i_crit_edge

while.body.i.while.body.i_crit_edge:              ; preds = %while.body.i
  %next.i.phi.trans.insert = getelementptr inbounds %struct.foo* %tmp5.i, i64 0, i32 0
  %tmp5.i.pre = load %struct.foo** %next.i.phi.trans.insert, align 8
  br label %while.body.i

if.end:                                           ; preds = %while.body.i
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
