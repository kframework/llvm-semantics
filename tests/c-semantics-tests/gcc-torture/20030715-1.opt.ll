; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030715-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"inetd\00", align 1
@ap_standalone = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"standalone\00", align 1
@.str2 = private unnamed_addr constant [50 x i8] c"ServerType must be either 'inetd' or 'standalone'\00", align 1

define noalias i8* @ap_check_cmd_context(i8* nocapture %a, i32 %b) nounwind uwtable readnone {
entry:
  ret i8* null
}

define i8* @server_type(i8* nocapture %a, i8* nocapture %b, i8* nocapture %arg) nounwind uwtable {
entry:
  %call1 = tail call i32 @strcmp(i8* %arg, i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind
  %tobool2 = icmp eq i32 %call1, 0
  br i1 %tobool2, label %if.end9, label %if.else

if.else:                                          ; preds = %entry
  %call4 = tail call i32 @strcmp(i8* %arg, i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0)) nounwind
  %tobool5 = icmp eq i32 %call4, 0
  br i1 %tobool5, label %if.end9, label %return

if.end9:                                          ; preds = %if.else, %entry
  %storemerge = phi i32 [ 0, %entry ], [ 1, %if.else ]
  store i32 %storemerge, i32* @ap_standalone, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end9
  %retval.0 = phi i8* [ null, %if.end9 ], [ getelementptr inbounds ([50 x i8]* @.str2, i64 0, i64 0), %if.else ]
  ret i8* %retval.0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @main() nounwind uwtable {
server_type.exit:
  store i32 1, i32* @ap_standalone, align 4
  ret i32 0
}
