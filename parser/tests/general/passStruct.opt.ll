; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/passStruct.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@str = internal constant [8 x i8] c"BUG: 10\00"
@str1 = internal constant [8 x i8] c"BUG: 20\00"
@str2 = internal constant [8 x i8] c"BUG: 30\00"
@str3 = internal constant [8 x i8] c"BUG: 11\00"
@str4 = internal constant [8 x i8] c"BUG: 21\00"
@str5 = internal constant [8 x i8] c"BUG: 31\00"
@str6 = internal constant [8 x i8] c"BUG: 12\00"
@str7 = internal constant [8 x i8] c"BUG: 22\00"
@str8 = internal constant [8 x i8] c"BUG: 33\00"
@str9 = internal constant [9 x i8] c"BUG: 123\00"
@str11 = internal constant [9 x i8] c"BUG: 22d\00"
@str12 = internal constant [4 x i8] c"End\00"

define i24 @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %tmp61 = trunc i24 %x.coerce to i8
  %tmp42 = trunc i24 %y.coerce to i8
  %tmp21 = trunc i24 %z.coerce to i8
  %tmp26 = lshr i24 %z.coerce, 16
  %cmp = icmp eq i8 %tmp61, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %0 = and i24 %x.coerce, 65280
  %cmp7 = icmp eq i24 %0, 5120
  br i1 %cmp7, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.end
  %puts83 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str1, i64 0, i64 0))
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then9
  %tmp66.mask = and i24 %x.coerce, -65536
  %cmp14 = icmp eq i24 %tmp66.mask, 1966080
  br i1 %cmp14, label %if.end18, label %if.then16

if.then16:                                        ; preds = %if.end11
  %puts84 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str2, i64 0, i64 0))
  br label %if.end18

if.end18:                                         ; preds = %if.end11, %if.then16
  %cmp22 = icmp eq i8 %tmp42, 11
  br i1 %cmp22, label %if.end26, label %if.then24

if.then24:                                        ; preds = %if.end18
  %puts85 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str3, i64 0, i64 0))
  br label %if.end26

if.end26:                                         ; preds = %if.end18, %if.then24
  %1 = and i24 %y.coerce, 65280
  %cmp30 = icmp eq i24 %1, 5376
  br i1 %cmp30, label %if.end34, label %if.then32

if.then32:                                        ; preds = %if.end26
  %puts86 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str4, i64 0, i64 0))
  br label %if.end34

if.end34:                                         ; preds = %if.end26, %if.then32
  %tmp48.mask = and i24 %y.coerce, -65536
  %cmp38 = icmp eq i24 %tmp48.mask, 2031616
  br i1 %cmp38, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end34
  %puts87 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str5, i64 0, i64 0))
  br label %if.end42

if.end42:                                         ; preds = %if.end34, %if.then40
  %cmp46 = icmp eq i8 %tmp21, 12
  br i1 %cmp46, label %if.end50, label %if.then48

if.then48:                                        ; preds = %if.end42
  %puts88 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str6, i64 0, i64 0))
  br label %if.end50

if.end50:                                         ; preds = %if.end42, %if.then48
  %2 = and i24 %z.coerce, 65280
  %cmp54 = icmp eq i24 %2, 5632
  br i1 %cmp54, label %if.end58, label %if.then56

if.then56:                                        ; preds = %if.end50
  %puts89 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str7, i64 0, i64 0))
  br label %if.end58

if.end58:                                         ; preds = %if.end50, %if.then56
  %cmp62 = icmp eq i24 %tmp26, 32
  br i1 %cmp62, label %if.end66, label %if.then64

if.then64:                                        ; preds = %if.end58
  %puts90 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str8, i64 0, i64 0))
  br label %if.end66

if.end66:                                         ; preds = %if.end58, %if.then64
  %cmp68 = icmp eq i64 %l, 123
  br i1 %cmp68, label %if.end72, label %if.then70

if.then70:                                        ; preds = %if.end66
  %puts91 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str9, i64 0, i64 0))
  br label %if.end72

if.end72:                                         ; preds = %if.end66, %if.then70
  %tmp8 = zext i24 %z.coerce to i32
  %mask12 = and i32 %tmp8, 255
  %tmp15 = zext i24 %tmp26 to i32
  %tmp16 = shl nuw nsw i32 %tmp15, 16
  %ins13 = or i32 %mask12, %tmp16
  %ins18 = or i32 %ins13, 19712
  %tmp6 = trunc i32 %ins18 to i24
  ret i24 %tmp6
}

define i32 @main() nounwind uwtable {
if.end:
  %call = tail call i24 @f(i32 3, i24 1971210, i24 2037003, i24 2102796, i64 123)
  %tmp4 = lshr i24 %call, 8
  %tmp5 = trunc i24 %tmp4 to i8
  %cmp29 = icmp eq i8 %tmp5, 77
  br i1 %cmp29, label %if.end33, label %if.then31

if.then31:                                        ; preds = %if.end
  %puts89 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str11, i64 0, i64 0))
  br label %if.end33

if.end33:                                         ; preds = %if.end, %if.then31
  %puts90 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str12, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
