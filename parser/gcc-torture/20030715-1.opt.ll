; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030715-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"inetd\00", align 1
@ap_standalone = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"standalone\00", align 1
@.str2 = private unnamed_addr constant [50 x i8] c"ServerType must be either 'inetd' or 'standalone'\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define noalias i8* @ap_check_cmd_context(i8* nocapture %a, i32 %b) nounwind uwtable readnone {
entry:
  ret i8* null
}

define i8* @server_type(i8* nocapture %a, i8* nocapture %b, i8* %arg) nounwind uwtable {
entry:
  %call4 = tail call i32 @strcmp(i8* %arg, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind
  %tobool5 = icmp eq i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %entry
  store i32 0, i32* @ap_standalone, align 4
  br label %return

if.else:                                          ; preds = %entry
  %call8 = tail call i32 @strcmp(i8* %arg, i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0)) nounwind
  %tobool9 = icmp eq i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %return

if.then10:                                        ; preds = %if.else
  store i32 1, i32* @ap_standalone, align 4
  br label %return

return:                                           ; preds = %if.then6, %if.then10, %if.else
  %0 = phi i8* [ getelementptr inbounds ([50 x i8]* @.str2, i64 0, i64 0), %if.else ], [ null, %if.then10 ], [ null, %if.then6 ]
  ret i8* %0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @main() nounwind uwtable {
server_type.exit:
  store i32 1, i32* @ap_standalone, align 4
  ret i32 0
}
