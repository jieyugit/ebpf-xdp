; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.9 = type { [2 x i32]*, [80 x i32]*, i32*, %struct.filter* }
%struct.filter = type { i32, i8, i8, i8, i32, i32, [4 x i32], [4 x i32], i8, i8, i8, i8, i8, i16, i8, i16, i8, i8, [2 x i8], %struct.tcpopts, %struct.udpopts, %struct.icmpopts }
%struct.tcpopts = type { i8, i16, i8, i16, i16, [2 x i8] }
%struct.udpopts = type { i8, i16, i8, i16 }
%struct.icmpopts = type { i8, i8, i8, i8 }
%struct.anon.10 = type { [6 x i32]*, i32*, %struct.datarec*, [5 x i32]* }
%struct.datarec = type { i64, i64 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.0 }
%union.anon.0 = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.2 }
%union.anon.2 = type { %struct.anon.3 }
%struct.anon.3 = type { i32, i32 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.5 }
%union.anon.5 = type { [1 x i32] }
%struct.icmphdr = type { i8, i8, i16, %union.anon.6 }
%union.anon.6 = type { i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }

@filters_map = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !0
@xdp_prog_main.____fmt = internal constant [22 x i8] c"Matched rule ID #%d.\0A\00", align 1, !dbg !54
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !345
@xdp_stats_map = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !348
@llvm.compiler.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.9* @filters_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_prog_main to i8*), i8* bitcast (%struct.anon.10* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_main(%struct.xdp_md* nocapture noundef readonly %0) #0 section "xdp" !dbg !56 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !71, metadata !DIExpression()), !dbg !401
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !402
  %6 = load i32, i32* %5, align 4, !dbg !402, !tbaa !403
  %7 = zext i32 %6 to i64, !dbg !408
  %8 = inttoptr i64 %7 to i8*, !dbg !409
  call void @llvm.dbg.value(metadata i8* %8, metadata !72, metadata !DIExpression()), !dbg !401
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !410
  %10 = load i32, i32* %9, align 4, !dbg !410, !tbaa !411
  %11 = zext i32 %10 to i64, !dbg !412
  %12 = inttoptr i64 %11 to i8*, !dbg !413
  call void @llvm.dbg.value(metadata i8* %12, metadata !73, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 2, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8* %12, metadata !75, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* null, metadata !92, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.iphdr* null, metadata !139, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* null, metadata !167, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.icmphdr* null, metadata !211, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.tcphdr* null, metadata !234, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.udphdr* null, metadata !256, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 0, metadata !265, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !80, metadata !DIExpression(DW_OP_deref)), !dbg !401
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !414, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i8* %8, metadata !421, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !422, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i8* %12, metadata !423, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i32 14, metadata !424, metadata !DIExpression()), !dbg !425
  %13 = getelementptr i8, i8* %12, i64 14, !dbg !427
  %14 = icmp ugt i8* %13, %8, !dbg !429
  br i1 %14, label %130, label %15, !dbg !430

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %12, metadata !423, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i8* %13, metadata !75, metadata !DIExpression()), !dbg !401
  %16 = getelementptr inbounds i8, i8* %12, i64 12, !dbg !431
  %17 = bitcast i8* %16 to i16*, !dbg !431
  %18 = load i16, i16* %17, align 1, !dbg !431, !tbaa !432
  call void @llvm.dbg.value(metadata i16 %18, metadata !79, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !401
  switch i16 %18, label %130 [
    i16 -8826, label %19
    i16 8, label %71
  ], !dbg !435

19:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !436, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata i8* %8, metadata !442, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata %struct.ipv6hdr** undef, metadata !443, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata i8* %13, metadata !444, metadata !DIExpression()), !dbg !445
  %20 = getelementptr i8, i8* %12, i64 54, !dbg !449
  %21 = bitcast i8* %20 to %struct.ipv6hdr*, !dbg !449
  %22 = inttoptr i64 %7 to %struct.ipv6hdr*, !dbg !451
  %23 = icmp ugt %struct.ipv6hdr* %21, %22, !dbg !452
  br i1 %23, label %29, label %24, !dbg !453

24:                                               ; preds = %19
  %25 = bitcast i8* %13 to %struct.ipv6hdr*, !dbg !454
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %25, metadata !444, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.value(metadata i8* %20, metadata !75, metadata !DIExpression()), !dbg !401
  %26 = getelementptr i8, i8* %12, i64 20, !dbg !455
  %27 = load i8, i8* %26, align 2, !dbg !455, !tbaa !456
  %28 = zext i8 %27 to i32, !dbg !458
  br label %29, !dbg !459

29:                                               ; preds = %19, %24
  %30 = phi i8* [ %13, %19 ], [ %20, %24 ], !dbg !401
  %31 = phi %struct.ipv6hdr* [ null, %19 ], [ %25, %24 ], !dbg !401
  %32 = phi i32 [ -1, %19 ], [ %28, %24 ], !dbg !445
  call void @llvm.dbg.value(metadata i8* %30, metadata !75, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %32, metadata !79, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %31, metadata !92, metadata !DIExpression()), !dbg !401
  %33 = icmp ne %struct.ipv6hdr* %31, null, !dbg !460
  %34 = icmp ne i32 %32, 17
  %35 = select i1 %33, i1 %34, i1 false, !dbg !462
  %36 = icmp ne i32 %32, 6
  %37 = select i1 %35, i1 %36, i1 false, !dbg !462
  %38 = icmp ne i32 %32, 58
  %39 = select i1 %37, i1 %38, i1 false, !dbg !462
  br i1 %39, label %648, label %40, !dbg !462

40:                                               ; preds = %29
  switch i32 %32, label %130 [
    i32 6, label %41
    i32 17, label %57
    i32 58, label %64
  ], !dbg !463

41:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !464, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata i8* %8, metadata !470, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !471, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata i8* %30, metadata !473, metadata !DIExpression()), !dbg !474
  %42 = getelementptr inbounds i8, i8* %30, i64 20, !dbg !477
  %43 = icmp ugt i8* %42, %8, !dbg !479
  br i1 %43, label %130, label %44, !dbg !480

44:                                               ; preds = %41
  %45 = getelementptr inbounds i8, i8* %30, i64 12, !dbg !481
  %46 = bitcast i8* %45 to i16*, !dbg !481
  %47 = load i16, i16* %46, align 4, !dbg !481
  %48 = lshr i16 %47, 2, !dbg !482
  %49 = and i16 %48, 60, !dbg !482
  call void @llvm.dbg.value(metadata i16 %49, metadata !472, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !474
  %50 = icmp ult i16 %49, 20, !dbg !483
  br i1 %50, label %130, label %51, !dbg !485

51:                                               ; preds = %44
  %52 = zext i16 %49 to i64
  call void @llvm.dbg.value(metadata i64 %52, metadata !472, metadata !DIExpression()), !dbg !474
  %53 = getelementptr i8, i8* %30, i64 %52, !dbg !486
  %54 = icmp ugt i8* %53, %8, !dbg !488
  br i1 %54, label %130, label %55, !dbg !489

55:                                               ; preds = %51
  call void @llvm.dbg.value(metadata i8* %53, metadata !75, metadata !DIExpression()), !dbg !401
  %56 = bitcast i8* %30 to %struct.tcphdr*, !dbg !490
  br label %130, !dbg !491

57:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !492, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i8* %8, metadata !498, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !499, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i8* %30, metadata !501, metadata !DIExpression()), !dbg !502
  %58 = getelementptr inbounds i8, i8* %30, i64 8, !dbg !504
  %59 = bitcast i8* %58 to %struct.udphdr*, !dbg !504
  %60 = inttoptr i64 %7 to %struct.udphdr*, !dbg !506
  %61 = icmp ugt %struct.udphdr* %59, %60, !dbg !507
  br i1 %61, label %130, label %62, !dbg !508

62:                                               ; preds = %57
  %63 = bitcast i8* %30 to %struct.udphdr*, !dbg !509
  call void @llvm.dbg.value(metadata %struct.udphdr* %63, metadata !501, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata %struct.udphdr* %59, metadata !75, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i16 undef, metadata !500, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !502
  br label %130, !dbg !510

64:                                               ; preds = %40
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !511, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i8* %8, metadata !517, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata %struct.icmp6hdr** undef, metadata !518, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i8* %30, metadata !519, metadata !DIExpression()), !dbg !520
  %65 = getelementptr inbounds i8, i8* %30, i64 8, !dbg !522
  %66 = bitcast i8* %65 to %struct.icmp6hdr*, !dbg !522
  %67 = inttoptr i64 %7 to %struct.icmp6hdr*, !dbg !524
  %68 = icmp ugt %struct.icmp6hdr* %66, %67, !dbg !525
  br i1 %68, label %130, label %69, !dbg !526

69:                                               ; preds = %64
  %70 = bitcast i8* %30 to %struct.icmp6hdr*, !dbg !527
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %70, metadata !519, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %66, metadata !75, metadata !DIExpression()), !dbg !401
  br label %130, !dbg !528

71:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !529, metadata !DIExpression()), !dbg !539
  call void @llvm.dbg.value(metadata i8* %8, metadata !535, metadata !DIExpression()), !dbg !539
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !536, metadata !DIExpression()), !dbg !539
  call void @llvm.dbg.value(metadata i8* %13, metadata !537, metadata !DIExpression()), !dbg !539
  %72 = getelementptr i8, i8* %12, i64 34, !dbg !543
  %73 = icmp ugt i8* %72, %8, !dbg !545
  br i1 %73, label %88, label %74, !dbg !546

74:                                               ; preds = %71
  %75 = load i8, i8* %13, align 4, !dbg !547
  %76 = shl i8 %75, 2, !dbg !548
  %77 = and i8 %76, 60, !dbg !548
  call void @llvm.dbg.value(metadata i8 %77, metadata !538, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !539
  %78 = icmp ult i8 %77, 20, !dbg !549
  br i1 %78, label %88, label %79, !dbg !551

79:                                               ; preds = %74
  %80 = zext i8 %77 to i64
  call void @llvm.dbg.value(metadata i64 %80, metadata !538, metadata !DIExpression()), !dbg !539
  %81 = getelementptr i8, i8* %13, i64 %80, !dbg !552
  %82 = icmp ugt i8* %81, %8, !dbg !554
  br i1 %82, label %88, label %83, !dbg !555

83:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8* %81, metadata !75, metadata !DIExpression()), !dbg !401
  %84 = bitcast i8* %13 to %struct.iphdr*, !dbg !556
  %85 = getelementptr i8, i8* %12, i64 23, !dbg !557
  %86 = load i8, i8* %85, align 1, !dbg !557, !tbaa !558
  %87 = zext i8 %86 to i32, !dbg !560
  br label %88, !dbg !561

88:                                               ; preds = %71, %74, %79, %83
  %89 = phi i8* [ %13, %71 ], [ %13, %74 ], [ %13, %79 ], [ %81, %83 ], !dbg !401
  %90 = phi %struct.iphdr* [ null, %71 ], [ null, %74 ], [ null, %79 ], [ %84, %83 ], !dbg !401
  %91 = phi i32 [ -1, %71 ], [ -1, %74 ], [ -1, %79 ], [ %87, %83 ], !dbg !539
  call void @llvm.dbg.value(metadata i8* %89, metadata !75, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %91, metadata !79, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata %struct.iphdr* %90, metadata !139, metadata !DIExpression()), !dbg !401
  %92 = icmp ne %struct.iphdr* %90, null, !dbg !562
  %93 = icmp ne i32 %91, 17
  %94 = select i1 %92, i1 %93, i1 false, !dbg !564
  %95 = icmp ne i32 %91, 6
  %96 = select i1 %94, i1 %95, i1 false, !dbg !564
  %97 = icmp ne i32 %91, 1
  %98 = select i1 %96, i1 %97, i1 false, !dbg !564
  br i1 %98, label %648, label %99, !dbg !564

99:                                               ; preds = %88
  switch i32 %91, label %130 [
    i32 6, label %100
    i32 17, label %116
    i32 1, label %123
  ], !dbg !565

100:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !464, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata i8* %8, metadata !470, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata %struct.tcphdr** undef, metadata !471, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.value(metadata i8* %89, metadata !473, metadata !DIExpression()), !dbg !566
  %101 = getelementptr inbounds i8, i8* %89, i64 20, !dbg !569
  %102 = icmp ugt i8* %101, %8, !dbg !570
  br i1 %102, label %130, label %103, !dbg !571

103:                                              ; preds = %100
  %104 = getelementptr inbounds i8, i8* %89, i64 12, !dbg !572
  %105 = bitcast i8* %104 to i16*, !dbg !572
  %106 = load i16, i16* %105, align 4, !dbg !572
  %107 = lshr i16 %106, 2, !dbg !573
  %108 = and i16 %107, 60, !dbg !573
  call void @llvm.dbg.value(metadata i16 %108, metadata !472, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !566
  %109 = icmp ult i16 %108, 20, !dbg !574
  br i1 %109, label %130, label %110, !dbg !575

110:                                              ; preds = %103
  %111 = zext i16 %108 to i64
  call void @llvm.dbg.value(metadata i64 %111, metadata !472, metadata !DIExpression()), !dbg !566
  %112 = getelementptr i8, i8* %89, i64 %111, !dbg !576
  %113 = icmp ugt i8* %112, %8, !dbg !577
  br i1 %113, label %130, label %114, !dbg !578

114:                                              ; preds = %110
  call void @llvm.dbg.value(metadata i8* %112, metadata !75, metadata !DIExpression()), !dbg !401
  %115 = bitcast i8* %89 to %struct.tcphdr*, !dbg !579
  br label %130, !dbg !580

116:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !492, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata i8* %8, metadata !498, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata %struct.udphdr** undef, metadata !499, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata i8* %89, metadata !501, metadata !DIExpression()), !dbg !581
  %117 = getelementptr inbounds i8, i8* %89, i64 8, !dbg !583
  %118 = bitcast i8* %117 to %struct.udphdr*, !dbg !583
  %119 = inttoptr i64 %7 to %struct.udphdr*, !dbg !584
  %120 = icmp ugt %struct.udphdr* %118, %119, !dbg !585
  br i1 %120, label %130, label %121, !dbg !586

121:                                              ; preds = %116
  %122 = bitcast i8* %89 to %struct.udphdr*, !dbg !587
  call void @llvm.dbg.value(metadata %struct.udphdr* %122, metadata !501, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata %struct.udphdr* %118, metadata !75, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i16 undef, metadata !500, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)), !dbg !581
  br label %130, !dbg !588

123:                                              ; preds = %99
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !589, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.value(metadata i8* %8, metadata !595, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.value(metadata %struct.icmphdr** undef, metadata !596, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.value(metadata i8* %89, metadata !597, metadata !DIExpression()), !dbg !598
  %124 = getelementptr inbounds i8, i8* %89, i64 8, !dbg !600
  %125 = bitcast i8* %124 to %struct.icmphdr*, !dbg !600
  %126 = inttoptr i64 %7 to %struct.icmphdr*, !dbg !602
  %127 = icmp ugt %struct.icmphdr* %125, %126, !dbg !603
  br i1 %127, label %130, label %128, !dbg !604

128:                                              ; preds = %123
  %129 = bitcast i8* %89 to %struct.icmphdr*, !dbg !605
  call void @llvm.dbg.value(metadata %struct.icmphdr* %129, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.value(metadata %struct.icmphdr* %125, metadata !75, metadata !DIExpression()), !dbg !401
  br label %130, !dbg !606

130:                                              ; preds = %1, %128, %123, %121, %116, %114, %110, %103, %100, %69, %64, %62, %57, %55, %51, %44, %41, %15, %99, %40
  %131 = phi %struct.ipv6hdr* [ null, %15 ], [ null, %99 ], [ %31, %40 ], [ %31, %41 ], [ %31, %44 ], [ %31, %51 ], [ %31, %55 ], [ %31, %57 ], [ %31, %62 ], [ %31, %64 ], [ %31, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !607
  %132 = phi %struct.iphdr* [ null, %15 ], [ %90, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ %90, %100 ], [ %90, %103 ], [ %90, %110 ], [ %90, %114 ], [ %90, %116 ], [ %90, %121 ], [ %90, %123 ], [ %90, %128 ], [ null, %1 ], !dbg !608
  %133 = phi %struct.icmp6hdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ %70, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !609
  %134 = phi %struct.icmphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ %129, %128 ], [ null, %1 ], !dbg !610
  %135 = phi %struct.tcphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ %56, %55 ], [ null, %57 ], [ null, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ %115, %114 ], [ null, %116 ], [ null, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !611
  %136 = phi %struct.udphdr* [ null, %15 ], [ null, %99 ], [ null, %40 ], [ null, %41 ], [ null, %44 ], [ null, %51 ], [ null, %55 ], [ null, %57 ], [ %63, %62 ], [ null, %64 ], [ null, %69 ], [ null, %100 ], [ null, %103 ], [ null, %110 ], [ null, %114 ], [ null, %116 ], [ %122, %121 ], [ null, %123 ], [ null, %128 ], [ null, %1 ], !dbg !612
  call void @llvm.dbg.value(metadata i8 0, metadata !266, metadata !DIExpression()), !dbg !613
  %137 = bitcast i32* %4 to i8*
  call void @llvm.dbg.value(metadata i32 2, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i8 0, metadata !266, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata i32 0, metadata !265, metadata !DIExpression()), !dbg !401
  %138 = icmp eq %struct.ipv6hdr* %131, null
  %139 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 0
  %140 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 1
  %141 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 2
  %142 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 0, i32 0, i32 0, i64 3
  %143 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 0
  %144 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 1
  %145 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 2
  %146 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 5, i32 0, i32 1, i32 0, i32 0, i64 3
  %147 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 4
  %148 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %131, i64 0, i32 2
  %149 = icmp eq %struct.iphdr* %132, null
  %150 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 8, i32 0, i32 0
  %151 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 8, i32 0, i32 1
  %152 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 1
  %153 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 5
  %154 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %132, i64 0, i32 2
  %155 = icmp eq %struct.tcphdr* %135, null
  %156 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 0
  %157 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 1
  %158 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %135, i64 0, i32 4
  %159 = icmp eq %struct.udphdr* %136, null
  %160 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %136, i64 0, i32 0
  %161 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %136, i64 0, i32 1
  %162 = icmp eq %struct.icmphdr* %134, null
  %163 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %134, i64 0, i32 1
  %164 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %134, i64 0, i32 0
  %165 = icmp eq %struct.icmp6hdr* %133, null
  %166 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %133, i64 0, i32 1
  %167 = getelementptr inbounds %struct.icmp6hdr, %struct.icmp6hdr* %133, i64 0, i32 0
  br label %168, !dbg !614

168:                                              ; preds = %130, %597
  %169 = phi i32 [ 0, %130 ], [ %600, %597 ]
  %170 = phi i32 [ 2, %130 ], [ %599, %597 ]
  %171 = phi i32 [ 0, %130 ], [ %598, %597 ]
  call void @llvm.dbg.value(metadata i32 %170, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %169, metadata !266, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata i32 %171, metadata !265, metadata !DIExpression()), !dbg !401
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %137) #4, !dbg !615
  call void @llvm.dbg.value(metadata i32 %169, metadata !268, metadata !DIExpression()), !dbg !616
  store i32 %169, i32* %4, align 4, !dbg !617, !tbaa !618
  call void @llvm.dbg.value(metadata i32* %4, metadata !268, metadata !DIExpression(DW_OP_deref)), !dbg !616
  %172 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.9* @filters_map to i8*), i8* noundef nonnull %137) #4, !dbg !619
  call void @llvm.dbg.value(metadata i8* %172, metadata !271, metadata !DIExpression()), !dbg !616
  %173 = icmp eq i8* %172, null, !dbg !620
  br i1 %173, label %596, label %174, !dbg !622

174:                                              ; preds = %168
  %175 = bitcast i8* %172 to i32*, !dbg !623
  %176 = getelementptr inbounds i8, i8* %172, i64 4, !dbg !624
  %177 = load i8, i8* %176, align 4, !dbg !624
  %178 = and i8 %177, 1, !dbg !624
  %179 = icmp eq i8 %178, 0, !dbg !626
  br i1 %179, label %597, label %180, !dbg !627

180:                                              ; preds = %174
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  br i1 %138, label %293, label %181, !dbg !628

181:                                              ; preds = %180
  %182 = getelementptr inbounds i8, i8* %172, i64 16, !dbg !629
  %183 = bitcast i8* %182 to i32*, !dbg !633
  %184 = load i32, i32* %183, align 4, !dbg !633, !tbaa !618
  %185 = icmp eq i32 %184, 0, !dbg !634
  br i1 %185, label %207, label %186, !dbg !635

186:                                              ; preds = %181
  %187 = load i32, i32* %139, align 4, !dbg !636, !tbaa !637
  %188 = icmp eq i32 %187, %184, !dbg !638
  br i1 %188, label %189, label %597, !dbg !639

189:                                              ; preds = %186
  %190 = load i32, i32* %140, align 4, !dbg !640, !tbaa !637
  %191 = getelementptr inbounds i8, i8* %172, i64 20, !dbg !641
  %192 = bitcast i8* %191 to i32*, !dbg !641
  %193 = load i32, i32* %192, align 4, !dbg !641, !tbaa !618
  %194 = icmp eq i32 %190, %193, !dbg !642
  br i1 %194, label %195, label %597, !dbg !643

195:                                              ; preds = %189
  %196 = load i32, i32* %141, align 4, !dbg !644, !tbaa !637
  %197 = getelementptr inbounds i8, i8* %172, i64 24, !dbg !645
  %198 = bitcast i8* %197 to i32*, !dbg !645
  %199 = load i32, i32* %198, align 4, !dbg !645, !tbaa !618
  %200 = icmp eq i32 %196, %199, !dbg !646
  br i1 %200, label %201, label %597, !dbg !647

201:                                              ; preds = %195
  %202 = load i32, i32* %142, align 4, !dbg !648, !tbaa !637
  %203 = getelementptr inbounds i8, i8* %172, i64 28, !dbg !649
  %204 = bitcast i8* %203 to i32*, !dbg !649
  %205 = load i32, i32* %204, align 4, !dbg !649, !tbaa !618
  %206 = icmp eq i32 %202, %205, !dbg !650
  br i1 %206, label %207, label %597, !dbg !651

207:                                              ; preds = %201, %181
  %208 = getelementptr inbounds i8, i8* %172, i64 32, !dbg !652
  %209 = bitcast i8* %208 to i32*, !dbg !654
  %210 = load i32, i32* %209, align 4, !dbg !654, !tbaa !618
  %211 = icmp eq i32 %210, 0, !dbg !655
  br i1 %211, label %233, label %212, !dbg !656

212:                                              ; preds = %207
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  %213 = load i32, i32* %143, align 4, !dbg !657, !tbaa !637
  %214 = icmp eq i32 %213, %210, !dbg !658
  br i1 %214, label %215, label %597, !dbg !659

215:                                              ; preds = %212
  %216 = load i32, i32* %144, align 4, !dbg !660, !tbaa !637
  %217 = getelementptr inbounds i8, i8* %172, i64 36, !dbg !661
  %218 = bitcast i8* %217 to i32*, !dbg !661
  %219 = load i32, i32* %218, align 4, !dbg !661, !tbaa !618
  %220 = icmp eq i32 %216, %219, !dbg !662
  br i1 %220, label %221, label %597, !dbg !663

221:                                              ; preds = %215
  %222 = load i32, i32* %145, align 4, !dbg !664, !tbaa !637
  %223 = getelementptr inbounds i8, i8* %172, i64 40, !dbg !665
  %224 = bitcast i8* %223 to i32*, !dbg !665
  %225 = load i32, i32* %224, align 4, !dbg !665, !tbaa !618
  %226 = icmp eq i32 %222, %225, !dbg !666
  br i1 %226, label %227, label %597, !dbg !667

227:                                              ; preds = %221
  %228 = load i32, i32* %146, align 4, !dbg !668, !tbaa !637
  %229 = getelementptr inbounds i8, i8* %172, i64 44, !dbg !669
  %230 = bitcast i8* %229 to i32*, !dbg !669
  %231 = load i32, i32* %230, align 4, !dbg !669, !tbaa !618
  %232 = icmp eq i32 %228, %231, !dbg !670
  br i1 %232, label %233, label %597, !dbg !671

233:                                              ; preds = %227, %207
  %234 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !672
  %235 = bitcast i8* %234 to i32*, !dbg !672
  %236 = load i32, i32* %235, align 4, !dbg !672, !tbaa !674
  %237 = icmp eq i32 %236, 0, !dbg !679
  br i1 %237, label %238, label %597, !dbg !680

238:                                              ; preds = %233
  %239 = getelementptr inbounds i8, i8* %172, i64 12, !dbg !681
  %240 = bitcast i8* %239 to i32*, !dbg !681
  %241 = load i32, i32* %240, align 4, !dbg !681, !tbaa !682
  %242 = icmp eq i32 %241, 0, !dbg !683
  br i1 %242, label %243, label %597, !dbg !684

243:                                              ; preds = %238
  %244 = getelementptr inbounds i8, i8* %172, i64 50, !dbg !685
  %245 = load i8, i8* %244, align 2, !dbg !685
  %246 = and i8 %245, 1, !dbg !685
  %247 = icmp eq i8 %246, 0, !dbg !687
  br i1 %247, label %253, label %248, !dbg !688

248:                                              ; preds = %243
  %249 = getelementptr inbounds i8, i8* %172, i64 51, !dbg !689
  %250 = load i8, i8* %249, align 1, !dbg !689, !tbaa !690
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  %251 = load i8, i8* %147, align 1, !dbg !691, !tbaa !692
  %252 = icmp ugt i8 %250, %251, !dbg !693
  br i1 %252, label %597, label %253, !dbg !694

253:                                              ; preds = %248, %243
  %254 = getelementptr inbounds i8, i8* %172, i64 48, !dbg !695
  %255 = load i8, i8* %254, align 4, !dbg !695
  %256 = and i8 %255, 1, !dbg !695
  %257 = icmp eq i8 %256, 0, !dbg !697
  br i1 %257, label %263, label %258, !dbg !698

258:                                              ; preds = %253
  %259 = getelementptr inbounds i8, i8* %172, i64 49, !dbg !699
  %260 = load i8, i8* %259, align 1, !dbg !699, !tbaa !700
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  %261 = load i8, i8* %147, align 1, !dbg !701, !tbaa !692
  %262 = icmp ult i8 %260, %261, !dbg !702
  br i1 %262, label %597, label %263, !dbg !703

263:                                              ; preds = %258, %253
  %264 = getelementptr inbounds i8, i8* %172, i64 56, !dbg !704
  %265 = load i8, i8* %264, align 4, !dbg !704
  %266 = and i8 %265, 1, !dbg !704
  %267 = icmp eq i8 %266, 0, !dbg !706
  br i1 %267, label %278, label %268, !dbg !707

268:                                              ; preds = %263
  %269 = getelementptr inbounds i8, i8* %172, i64 58, !dbg !708
  %270 = bitcast i8* %269 to i16*, !dbg !708
  %271 = load i16, i16* %270, align 2, !dbg !708, !tbaa !709
  %272 = zext i16 %271 to i64, !dbg !710
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  %273 = load i16, i16* %148, align 4, !dbg !711, !tbaa !712
  %274 = call i16 @llvm.bswap.i16(i16 %273)
  %275 = zext i16 %274 to i64, !dbg !711
  %276 = add nuw nsw i64 %275, 14, !dbg !713
  %277 = icmp ult i64 %276, %272, !dbg !714
  br i1 %277, label %597, label %278, !dbg !715

278:                                              ; preds = %268, %263
  %279 = getelementptr inbounds i8, i8* %172, i64 52, !dbg !716
  %280 = load i8, i8* %279, align 4, !dbg !716
  %281 = and i8 %280, 1, !dbg !716
  %282 = icmp eq i8 %281, 0, !dbg !718
  br i1 %282, label %412, label %283, !dbg !719

283:                                              ; preds = %278
  %284 = getelementptr inbounds i8, i8* %172, i64 54, !dbg !720
  %285 = bitcast i8* %284 to i16*, !dbg !720
  %286 = load i16, i16* %285, align 2, !dbg !720, !tbaa !721
  %287 = zext i16 %286 to i64, !dbg !722
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %131, metadata !92, metadata !DIExpression()), !dbg !401
  %288 = load i16, i16* %148, align 4, !dbg !723, !tbaa !712
  %289 = call i16 @llvm.bswap.i16(i16 %288)
  %290 = zext i16 %289 to i64, !dbg !723
  %291 = add nuw nsw i64 %290, 14, !dbg !724
  %292 = icmp ugt i64 %291, %287, !dbg !725
  br i1 %292, label %597, label %412, !dbg !726

293:                                              ; preds = %180
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  br i1 %149, label %412, label %294, !dbg !727

294:                                              ; preds = %293
  %295 = getelementptr inbounds i8, i8* %172, i64 8, !dbg !728
  %296 = bitcast i8* %295 to i32*, !dbg !728
  %297 = load i32, i32* %296, align 4, !dbg !728, !tbaa !674
  %298 = icmp eq i32 %297, 0, !dbg !732
  br i1 %298, label %302, label %299, !dbg !733

299:                                              ; preds = %294
  %300 = load i32, i32* %150, align 4, !dbg !734, !tbaa !637
  %301 = icmp eq i32 %300, %297, !dbg !735
  br i1 %301, label %302, label %597, !dbg !736

302:                                              ; preds = %299, %294
  %303 = getelementptr inbounds i8, i8* %172, i64 12, !dbg !737
  %304 = bitcast i8* %303 to i32*, !dbg !737
  %305 = load i32, i32* %304, align 4, !dbg !737, !tbaa !682
  %306 = icmp eq i32 %305, 0, !dbg !739
  br i1 %306, label %310, label %307, !dbg !740

307:                                              ; preds = %302
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %308 = load i32, i32* %151, align 4, !dbg !741, !tbaa !637
  %309 = icmp eq i32 %308, %305, !dbg !742
  br i1 %309, label %310, label %597, !dbg !743

310:                                              ; preds = %307, %302
  %311 = getelementptr inbounds i8, i8* %172, i64 16, !dbg !744
  %312 = bitcast i8* %311 to i32*, !dbg !746
  %313 = load i32, i32* %312, align 4, !dbg !746, !tbaa !618
  %314 = icmp eq i32 %313, 0, !dbg !747
  br i1 %314, label %315, label %597, !dbg !748

315:                                              ; preds = %310
  %316 = getelementptr inbounds i8, i8* %172, i64 20, !dbg !749
  %317 = bitcast i8* %316 to i32*, !dbg !749
  %318 = load i32, i32* %317, align 4, !dbg !749, !tbaa !618
  %319 = icmp eq i32 %318, 0, !dbg !750
  br i1 %319, label %320, label %597, !dbg !751

320:                                              ; preds = %315
  %321 = getelementptr inbounds i8, i8* %172, i64 24, !dbg !752
  %322 = bitcast i8* %321 to i32*, !dbg !752
  %323 = load i32, i32* %322, align 4, !dbg !752, !tbaa !618
  %324 = icmp eq i32 %323, 0, !dbg !753
  br i1 %324, label %325, label %597, !dbg !754

325:                                              ; preds = %320
  %326 = getelementptr inbounds i8, i8* %172, i64 28, !dbg !755
  %327 = bitcast i8* %326 to i32*, !dbg !755
  %328 = load i32, i32* %327, align 4, !dbg !755, !tbaa !618
  %329 = icmp eq i32 %328, 0, !dbg !756
  br i1 %329, label %330, label %597, !dbg !757

330:                                              ; preds = %325
  %331 = getelementptr inbounds i8, i8* %172, i64 32, !dbg !758
  %332 = bitcast i8* %331 to i32*, !dbg !759
  %333 = load i32, i32* %332, align 4, !dbg !759, !tbaa !618
  %334 = icmp eq i32 %333, 0, !dbg !760
  br i1 %334, label %335, label %597, !dbg !761

335:                                              ; preds = %330
  %336 = getelementptr inbounds i8, i8* %172, i64 36, !dbg !762
  %337 = bitcast i8* %336 to i32*, !dbg !762
  %338 = load i32, i32* %337, align 4, !dbg !762, !tbaa !618
  %339 = icmp eq i32 %338, 0, !dbg !763
  br i1 %339, label %340, label %597, !dbg !764

340:                                              ; preds = %335
  %341 = getelementptr inbounds i8, i8* %172, i64 40, !dbg !765
  %342 = bitcast i8* %341 to i32*, !dbg !765
  %343 = load i32, i32* %342, align 4, !dbg !765, !tbaa !618
  %344 = icmp eq i32 %343, 0, !dbg !766
  br i1 %344, label %345, label %597, !dbg !767

345:                                              ; preds = %340
  %346 = getelementptr inbounds i8, i8* %172, i64 44, !dbg !768
  %347 = bitcast i8* %346 to i32*, !dbg !768
  %348 = load i32, i32* %347, align 4, !dbg !768, !tbaa !618
  %349 = icmp eq i32 %348, 0, !dbg !769
  br i1 %349, label %350, label %597, !dbg !770

350:                                              ; preds = %345
  %351 = getelementptr inbounds i8, i8* %172, i64 60, !dbg !771
  %352 = load i8, i8* %351, align 4, !dbg !771
  %353 = and i8 %352, 1, !dbg !771
  %354 = icmp eq i8 %353, 0, !dbg !773
  br i1 %354, label %362, label %355, !dbg !774

355:                                              ; preds = %350
  %356 = getelementptr inbounds i8, i8* %172, i64 61, !dbg !775
  %357 = load i8, i8* %356, align 1, !dbg !775, !tbaa !776
  %358 = sext i8 %357 to i32, !dbg !777
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %359 = load i8, i8* %152, align 1, !dbg !778, !tbaa !779
  %360 = zext i8 %359 to i32, !dbg !780
  %361 = icmp eq i32 %358, %360, !dbg !781
  br i1 %361, label %362, label %597, !dbg !782

362:                                              ; preds = %355, %350
  %363 = getelementptr inbounds i8, i8* %172, i64 50, !dbg !783
  %364 = load i8, i8* %363, align 2, !dbg !783
  %365 = and i8 %364, 1, !dbg !783
  %366 = icmp eq i8 %365, 0, !dbg !785
  br i1 %366, label %372, label %367, !dbg !786

367:                                              ; preds = %362
  %368 = getelementptr inbounds i8, i8* %172, i64 51, !dbg !787
  %369 = load i8, i8* %368, align 1, !dbg !787, !tbaa !690
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %370 = load i8, i8* %153, align 4, !dbg !788, !tbaa !789
  %371 = icmp ult i8 %369, %370, !dbg !790
  br i1 %371, label %597, label %372, !dbg !791

372:                                              ; preds = %367, %362
  %373 = getelementptr inbounds i8, i8* %172, i64 48, !dbg !792
  %374 = load i8, i8* %373, align 4, !dbg !792
  %375 = and i8 %374, 1, !dbg !792
  %376 = icmp eq i8 %375, 0, !dbg !794
  br i1 %376, label %382, label %377, !dbg !795

377:                                              ; preds = %372
  %378 = getelementptr inbounds i8, i8* %172, i64 49, !dbg !796
  %379 = load i8, i8* %378, align 1, !dbg !796, !tbaa !700
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %380 = load i8, i8* %153, align 4, !dbg !797, !tbaa !789
  %381 = icmp ugt i8 %379, %380, !dbg !798
  br i1 %381, label %597, label %382, !dbg !799

382:                                              ; preds = %377, %372
  %383 = getelementptr inbounds i8, i8* %172, i64 56, !dbg !800
  %384 = load i8, i8* %383, align 4, !dbg !800
  %385 = and i8 %384, 1, !dbg !800
  %386 = icmp eq i8 %385, 0, !dbg !802
  br i1 %386, label %397, label %387, !dbg !803

387:                                              ; preds = %382
  %388 = getelementptr inbounds i8, i8* %172, i64 58, !dbg !804
  %389 = bitcast i8* %388 to i16*, !dbg !804
  %390 = load i16, i16* %389, align 2, !dbg !804, !tbaa !709
  %391 = zext i16 %390 to i64, !dbg !805
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %392 = load i16, i16* %154, align 2, !dbg !806, !tbaa !807
  %393 = call i16 @llvm.bswap.i16(i16 %392)
  %394 = zext i16 %393 to i64, !dbg !806
  %395 = add nuw nsw i64 %394, 14, !dbg !808
  %396 = icmp ugt i64 %395, %391, !dbg !809
  br i1 %396, label %597, label %397, !dbg !810

397:                                              ; preds = %387, %382
  %398 = getelementptr inbounds i8, i8* %172, i64 52, !dbg !811
  %399 = load i8, i8* %398, align 4, !dbg !811
  %400 = and i8 %399, 1, !dbg !811
  %401 = icmp eq i8 %400, 0, !dbg !813
  br i1 %401, label %412, label %402, !dbg !814

402:                                              ; preds = %397
  %403 = getelementptr inbounds i8, i8* %172, i64 54, !dbg !815
  %404 = bitcast i8* %403 to i16*, !dbg !815
  %405 = load i16, i16* %404, align 2, !dbg !815, !tbaa !721
  %406 = zext i16 %405 to i64, !dbg !816
  call void @llvm.dbg.value(metadata %struct.iphdr* %132, metadata !139, metadata !DIExpression()), !dbg !401
  %407 = load i16, i16* %154, align 2, !dbg !817, !tbaa !807
  %408 = call i16 @llvm.bswap.i16(i16 %407)
  %409 = zext i16 %408 to i64, !dbg !817
  %410 = add nuw nsw i64 %409, 14, !dbg !818
  %411 = icmp ult i64 %410, %406, !dbg !819
  br i1 %411, label %597, label %412, !dbg !820

412:                                              ; preds = %293, %402, %397, %278, %283
  %413 = getelementptr inbounds i8, i8* %172, i64 64, !dbg !821
  %414 = load i8, i8* %413, align 4, !dbg !823
  %415 = and i8 %414, 1, !dbg !823
  %416 = icmp eq i8 %415, 0, !dbg !824
  br i1 %416, label %518, label %417, !dbg !825

417:                                              ; preds = %412
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  br i1 %155, label %597, label %418, !dbg !826

418:                                              ; preds = %417
  %419 = and i8 %414, 2, !dbg !828
  %420 = icmp eq i8 %419, 0, !dbg !828
  br i1 %420, label %428, label %421, !dbg !830

421:                                              ; preds = %418
  %422 = getelementptr inbounds i8, i8* %172, i64 66, !dbg !831
  %423 = bitcast i8* %422 to i16*, !dbg !831
  %424 = load i16, i16* %423, align 2, !dbg !831, !tbaa !832
  %425 = call i16 @llvm.bswap.i16(i16 %424)
  %426 = load i16, i16* %156, align 4, !dbg !833, !tbaa !834
  %427 = icmp eq i16 %425, %426, !dbg !836
  br i1 %427, label %428, label %597, !dbg !837

428:                                              ; preds = %421, %418
  %429 = getelementptr inbounds i8, i8* %172, i64 68, !dbg !838
  %430 = load i8, i8* %429, align 4, !dbg !838
  %431 = and i8 %430, 1, !dbg !838
  %432 = icmp eq i8 %431, 0, !dbg !840
  br i1 %432, label %440, label %433, !dbg !841

433:                                              ; preds = %428
  %434 = getelementptr inbounds i8, i8* %172, i64 70, !dbg !842
  %435 = bitcast i8* %434 to i16*, !dbg !842
  %436 = load i16, i16* %435, align 2, !dbg !842, !tbaa !843
  %437 = call i16 @llvm.bswap.i16(i16 %436)
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %438 = load i16, i16* %157, align 2, !dbg !844, !tbaa !845
  %439 = icmp eq i16 %437, %438, !dbg !846
  br i1 %439, label %440, label %597, !dbg !847

440:                                              ; preds = %433, %428
  %441 = getelementptr inbounds i8, i8* %172, i64 72, !dbg !848
  %442 = bitcast i8* %441 to i16*, !dbg !848
  %443 = load i16, i16* %442, align 4, !dbg !848
  %444 = and i16 %443, 1, !dbg !848
  %445 = icmp eq i16 %444, 0, !dbg !850
  br i1 %445, label %453, label %446, !dbg !851

446:                                              ; preds = %440
  %447 = lshr i16 %443, 1, !dbg !852
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %448 = load i16, i16* %158, align 4, !dbg !853
  %449 = lshr i16 %448, 13, !dbg !853
  %450 = xor i16 %449, %447, !dbg !854
  %451 = and i16 %450, 1, !dbg !854
  %452 = icmp eq i16 %451, 0, !dbg !854
  br i1 %452, label %453, label %597, !dbg !855

453:                                              ; preds = %446, %440
  %454 = and i16 %443, 4, !dbg !856
  %455 = icmp eq i16 %454, 0, !dbg !856
  br i1 %455, label %463, label %456, !dbg !858

456:                                              ; preds = %453
  %457 = lshr i16 %443, 3, !dbg !859
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %458 = load i16, i16* %158, align 4, !dbg !860
  %459 = lshr i16 %458, 12, !dbg !860
  %460 = xor i16 %459, %457, !dbg !861
  %461 = and i16 %460, 1, !dbg !861
  %462 = icmp eq i16 %461, 0, !dbg !861
  br i1 %462, label %463, label %597, !dbg !862

463:                                              ; preds = %456, %453
  %464 = and i16 %443, 16, !dbg !863
  %465 = icmp eq i16 %464, 0, !dbg !863
  br i1 %465, label %473, label %466, !dbg !865

466:                                              ; preds = %463
  %467 = lshr i16 %443, 5, !dbg !866
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %468 = load i16, i16* %158, align 4, !dbg !867
  %469 = lshr i16 %468, 10, !dbg !867
  %470 = xor i16 %469, %467, !dbg !868
  %471 = and i16 %470, 1, !dbg !868
  %472 = icmp eq i16 %471, 0, !dbg !868
  br i1 %472, label %473, label %597, !dbg !869

473:                                              ; preds = %466, %463
  %474 = and i16 %443, 64, !dbg !870
  %475 = icmp eq i16 %474, 0, !dbg !870
  br i1 %475, label %483, label %476, !dbg !872

476:                                              ; preds = %473
  %477 = lshr i16 %443, 7, !dbg !873
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %478 = load i16, i16* %158, align 4, !dbg !874
  %479 = lshr i16 %478, 11, !dbg !874
  %480 = xor i16 %479, %477, !dbg !875
  %481 = and i16 %480, 1, !dbg !875
  %482 = icmp eq i16 %481, 0, !dbg !875
  br i1 %482, label %483, label %597, !dbg !876

483:                                              ; preds = %476, %473
  %484 = and i16 %443, 256, !dbg !877
  %485 = icmp eq i16 %484, 0, !dbg !877
  br i1 %485, label %491, label %486, !dbg !879

486:                                              ; preds = %483
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %487 = load i16, i16* %158, align 4, !dbg !880
  %488 = xor i16 %487, %443, !dbg !881
  %489 = and i16 %488, 512, !dbg !881
  %490 = icmp eq i16 %489, 0, !dbg !881
  br i1 %490, label %491, label %597, !dbg !882

491:                                              ; preds = %486, %483
  %492 = and i16 %443, 1024, !dbg !883
  %493 = icmp eq i16 %492, 0, !dbg !883
  br i1 %493, label %501, label %494, !dbg !885

494:                                              ; preds = %491
  %495 = lshr i16 %443, 11, !dbg !886
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %496 = load i16, i16* %158, align 4, !dbg !887
  %497 = lshr i16 %496, 8, !dbg !887
  %498 = xor i16 %497, %495, !dbg !888
  %499 = and i16 %498, 1, !dbg !888
  %500 = icmp eq i16 %499, 0, !dbg !888
  br i1 %500, label %501, label %597, !dbg !889

501:                                              ; preds = %494, %491
  %502 = and i16 %443, 4096, !dbg !890
  %503 = icmp eq i16 %502, 0, !dbg !890
  br i1 %503, label %511, label %504, !dbg !892

504:                                              ; preds = %501
  %505 = lshr i16 %443, 13, !dbg !893
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %506 = load i16, i16* %158, align 4, !dbg !894
  %507 = lshr i16 %506, 14, !dbg !894
  %508 = xor i16 %507, %505, !dbg !895
  %509 = and i16 %508, 1, !dbg !895
  %510 = icmp eq i16 %509, 0, !dbg !895
  br i1 %510, label %511, label %597, !dbg !896

511:                                              ; preds = %504, %501
  %512 = and i16 %443, 16384, !dbg !897
  %513 = icmp eq i16 %512, 0, !dbg !897
  br i1 %513, label %589, label %514, !dbg !899

514:                                              ; preds = %511
  call void @llvm.dbg.value(metadata %struct.tcphdr* %135, metadata !234, metadata !DIExpression()), !dbg !401
  %515 = load i16, i16* %158, align 4, !dbg !900
  %516 = xor i16 %515, %443, !dbg !901
  %517 = icmp sgt i16 %516, -1, !dbg !901
  br i1 %517, label %589, label %597, !dbg !902

518:                                              ; preds = %412
  %519 = getelementptr inbounds i8, i8* %172, i64 76, !dbg !903
  %520 = load i8, i8* %519, align 4, !dbg !905
  %521 = and i8 %520, 1, !dbg !905
  %522 = icmp eq i8 %521, 0, !dbg !906
  br i1 %522, label %546, label %523, !dbg !907

523:                                              ; preds = %518
  call void @llvm.dbg.value(metadata %struct.udphdr* %136, metadata !256, metadata !DIExpression()), !dbg !401
  br i1 %159, label %597, label %524, !dbg !908

524:                                              ; preds = %523
  %525 = and i8 %520, 2, !dbg !910
  %526 = icmp eq i8 %525, 0, !dbg !910
  br i1 %526, label %534, label %527, !dbg !912

527:                                              ; preds = %524
  %528 = getelementptr inbounds i8, i8* %172, i64 78, !dbg !913
  %529 = bitcast i8* %528 to i16*, !dbg !913
  %530 = load i16, i16* %529, align 2, !dbg !913, !tbaa !914
  %531 = call i16 @llvm.bswap.i16(i16 %530)
  %532 = load i16, i16* %160, align 2, !dbg !915, !tbaa !916
  %533 = icmp eq i16 %531, %532, !dbg !918
  br i1 %533, label %534, label %597, !dbg !919

534:                                              ; preds = %527, %524
  %535 = getelementptr inbounds i8, i8* %172, i64 80, !dbg !920
  %536 = load i8, i8* %535, align 4, !dbg !920
  %537 = and i8 %536, 1, !dbg !920
  %538 = icmp eq i8 %537, 0, !dbg !922
  br i1 %538, label %589, label %539, !dbg !923

539:                                              ; preds = %534
  %540 = getelementptr inbounds i8, i8* %172, i64 82, !dbg !924
  %541 = bitcast i8* %540 to i16*, !dbg !924
  %542 = load i16, i16* %541, align 2, !dbg !924, !tbaa !925
  %543 = call i16 @llvm.bswap.i16(i16 %542)
  call void @llvm.dbg.value(metadata %struct.udphdr* %136, metadata !256, metadata !DIExpression()), !dbg !401
  %544 = load i16, i16* %161, align 2, !dbg !926, !tbaa !927
  %545 = icmp eq i16 %543, %544, !dbg !928
  br i1 %545, label %589, label %597, !dbg !929

546:                                              ; preds = %518
  %547 = getelementptr inbounds i8, i8* %172, i64 84, !dbg !930
  %548 = load i8, i8* %547, align 4, !dbg !932
  %549 = and i8 %548, 1, !dbg !932
  %550 = icmp eq i8 %549, 0, !dbg !933
  br i1 %550, label %589, label %551, !dbg !934

551:                                              ; preds = %546
  call void @llvm.dbg.value(metadata %struct.icmphdr* %134, metadata !211, metadata !DIExpression()), !dbg !401
  br i1 %162, label %570, label %552, !dbg !935

552:                                              ; preds = %551
  %553 = and i8 %548, 2, !dbg !937
  %554 = icmp eq i8 %553, 0, !dbg !937
  br i1 %554, label %560, label %555, !dbg !941

555:                                              ; preds = %552
  %556 = getelementptr inbounds i8, i8* %172, i64 85, !dbg !942
  %557 = load i8, i8* %556, align 1, !dbg !942, !tbaa !943
  %558 = load i8, i8* %163, align 1, !dbg !944, !tbaa !945
  %559 = icmp eq i8 %557, %558, !dbg !947
  br i1 %559, label %560, label %597, !dbg !948

560:                                              ; preds = %555, %552
  %561 = getelementptr inbounds i8, i8* %172, i64 86, !dbg !949
  %562 = load i8, i8* %561, align 2, !dbg !949
  %563 = and i8 %562, 1, !dbg !949
  %564 = icmp eq i8 %563, 0, !dbg !951
  br i1 %564, label %589, label %565, !dbg !952

565:                                              ; preds = %560
  %566 = getelementptr inbounds i8, i8* %172, i64 87, !dbg !953
  %567 = load i8, i8* %566, align 1, !dbg !953, !tbaa !954
  call void @llvm.dbg.value(metadata %struct.icmphdr* %134, metadata !211, metadata !DIExpression()), !dbg !401
  %568 = load i8, i8* %164, align 4, !dbg !955, !tbaa !956
  %569 = icmp eq i8 %567, %568, !dbg !957
  br i1 %569, label %589, label %597, !dbg !958

570:                                              ; preds = %551
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %133, metadata !167, metadata !DIExpression()), !dbg !401
  br i1 %165, label %597, label %571, !dbg !959

571:                                              ; preds = %570
  %572 = and i8 %548, 2, !dbg !960
  %573 = icmp eq i8 %572, 0, !dbg !960
  br i1 %573, label %579, label %574, !dbg !964

574:                                              ; preds = %571
  %575 = getelementptr inbounds i8, i8* %172, i64 85, !dbg !965
  %576 = load i8, i8* %575, align 1, !dbg !965, !tbaa !943
  %577 = load i8, i8* %166, align 1, !dbg !966, !tbaa !967
  %578 = icmp eq i8 %576, %577, !dbg !969
  br i1 %578, label %579, label %597, !dbg !970

579:                                              ; preds = %574, %571
  %580 = getelementptr inbounds i8, i8* %172, i64 86, !dbg !971
  %581 = load i8, i8* %580, align 2, !dbg !971
  %582 = and i8 %581, 1, !dbg !971
  %583 = icmp eq i8 %582, 0, !dbg !973
  br i1 %583, label %589, label %584, !dbg !974

584:                                              ; preds = %579
  %585 = getelementptr inbounds i8, i8* %172, i64 87, !dbg !975
  %586 = load i8, i8* %585, align 1, !dbg !975, !tbaa !954
  call void @llvm.dbg.value(metadata %struct.icmp6hdr* %133, metadata !167, metadata !DIExpression()), !dbg !401
  %587 = load i8, i8* %167, align 4, !dbg !976, !tbaa !977
  %588 = icmp eq i8 %586, %587, !dbg !978
  br i1 %588, label %589, label %597, !dbg !979

589:                                              ; preds = %539, %534, %565, %560, %579, %584, %546, %511, %514
  %590 = load i32, i32* %175, align 4, !dbg !980, !tbaa !982
  %591 = add i32 %590, -1, !dbg !980
  %592 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @xdp_prog_main.____fmt, i64 0, i64 0), i32 noundef 22, i32 noundef %591) #4, !dbg !980
  %593 = getelementptr inbounds i8, i8* %172, i64 5, !dbg !983
  %594 = load i8, i8* %593, align 1, !dbg !983, !tbaa !984
  %595 = zext i8 %594 to i32, !dbg !985
  call void @llvm.dbg.value(metadata i32 %595, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 1, metadata !265, metadata !DIExpression()), !dbg !401
  br label %597, !dbg !986

596:                                              ; preds = %168
  call void @llvm.dbg.value(metadata i32 %170, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %171, metadata !265, metadata !DIExpression()), !dbg !401
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %137) #4, !dbg !986
  br label %602

597:                                              ; preds = %589, %174, %201, %195, %189, %186, %227, %221, %215, %212, %238, %233, %248, %258, %268, %283, %299, %307, %345, %340, %335, %330, %325, %320, %315, %310, %355, %367, %377, %387, %402, %417, %421, %433, %446, %456, %466, %476, %486, %494, %504, %514, %523, %527, %539, %555, %565, %574, %584, %570
  %598 = phi i32 [ %171, %570 ], [ %171, %584 ], [ %171, %574 ], [ %171, %565 ], [ %171, %555 ], [ %171, %539 ], [ %171, %527 ], [ %171, %523 ], [ %171, %514 ], [ %171, %504 ], [ %171, %494 ], [ %171, %486 ], [ %171, %476 ], [ %171, %466 ], [ %171, %456 ], [ %171, %446 ], [ %171, %433 ], [ %171, %421 ], [ %171, %417 ], [ %171, %402 ], [ %171, %387 ], [ %171, %377 ], [ %171, %367 ], [ %171, %355 ], [ %171, %310 ], [ %171, %315 ], [ %171, %320 ], [ %171, %325 ], [ %171, %330 ], [ %171, %335 ], [ %171, %340 ], [ %171, %345 ], [ %171, %307 ], [ %171, %299 ], [ %171, %283 ], [ %171, %268 ], [ %171, %258 ], [ %171, %248 ], [ %171, %233 ], [ %171, %238 ], [ %171, %212 ], [ %171, %215 ], [ %171, %221 ], [ %171, %227 ], [ %171, %186 ], [ %171, %189 ], [ %171, %195 ], [ %171, %201 ], [ %171, %174 ], [ 1, %589 ]
  %599 = phi i32 [ %170, %570 ], [ %170, %584 ], [ %170, %574 ], [ %170, %565 ], [ %170, %555 ], [ %170, %539 ], [ %170, %527 ], [ %170, %523 ], [ %170, %514 ], [ %170, %504 ], [ %170, %494 ], [ %170, %486 ], [ %170, %476 ], [ %170, %466 ], [ %170, %456 ], [ %170, %446 ], [ %170, %433 ], [ %170, %421 ], [ %170, %417 ], [ %170, %402 ], [ %170, %387 ], [ %170, %377 ], [ %170, %367 ], [ %170, %355 ], [ %170, %310 ], [ %170, %315 ], [ %170, %320 ], [ %170, %325 ], [ %170, %330 ], [ %170, %335 ], [ %170, %340 ], [ %170, %345 ], [ %170, %307 ], [ %170, %299 ], [ %170, %283 ], [ %170, %268 ], [ %170, %258 ], [ %170, %248 ], [ %170, %233 ], [ %170, %238 ], [ %170, %212 ], [ %170, %215 ], [ %170, %221 ], [ %170, %227 ], [ %170, %186 ], [ %170, %189 ], [ %170, %195 ], [ %170, %201 ], [ %170, %174 ], [ %595, %589 ]
  call void @llvm.dbg.value(metadata i32 undef, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 undef, metadata !265, metadata !DIExpression()), !dbg !401
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %137) #4, !dbg !986
  %600 = add nuw nsw i32 %169, 1, !dbg !987
  call void @llvm.dbg.value(metadata i32 %599, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %600, metadata !266, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata i32 %598, metadata !265, metadata !DIExpression()), !dbg !401
  %601 = icmp eq i32 %600, 80, !dbg !988
  br i1 %601, label %602, label %168, !dbg !614, !llvm.loop !989

602:                                              ; preds = %597, %596
  %603 = phi i32 [ %171, %596 ], [ %598, %597 ]
  %604 = phi i32 [ %170, %596 ], [ %599, %597 ]
  call void @llvm.dbg.value(metadata i32 %604, metadata !74, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.value(metadata i32 %603, metadata !265, metadata !DIExpression()), !dbg !401
  %605 = icmp eq i32 %603, 1, !dbg !992
  br i1 %605, label %606, label %628, !dbg !994

606:                                              ; preds = %602
  %607 = bitcast i32* %3 to i8*, !dbg !995
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %607), !dbg !995
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1000, metadata !DIExpression()) #4, !dbg !995
  call void @llvm.dbg.value(metadata i32 %604, metadata !1001, metadata !DIExpression()) #4, !dbg !995
  store i32 %604, i32* %3, align 4, !tbaa !618
  %608 = load i32, i32* %5, align 4, !dbg !1008, !tbaa !403
  %609 = zext i32 %608 to i64, !dbg !1009
  call void @llvm.dbg.value(metadata i64 %609, metadata !1002, metadata !DIExpression()) #4, !dbg !995
  %610 = load i32, i32* %9, align 4, !dbg !1010, !tbaa !411
  %611 = zext i32 %610 to i64, !dbg !1011
  call void @llvm.dbg.value(metadata i64 %611, metadata !1003, metadata !DIExpression()) #4, !dbg !995
  %612 = icmp ugt i32 %604, 4, !dbg !1012
  br i1 %612, label %626, label %613, !dbg !1014

613:                                              ; preds = %606
  call void @llvm.dbg.value(metadata i32* %3, metadata !1001, metadata !DIExpression(DW_OP_deref)) #4, !dbg !995
  %614 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.10* @xdp_stats_map to i8*), i8* noundef nonnull %607) #4, !dbg !1015
  call void @llvm.dbg.value(metadata i8* %614, metadata !1004, metadata !DIExpression()) #4, !dbg !995
  %615 = icmp eq i8* %614, null, !dbg !1016
  br i1 %615, label %626, label %616, !dbg !1018

616:                                              ; preds = %613
  call void @llvm.dbg.value(metadata i8* %614, metadata !1004, metadata !DIExpression()) #4, !dbg !995
  %617 = sub nsw i64 %609, %611, !dbg !1019
  call void @llvm.dbg.value(metadata i64 %617, metadata !1005, metadata !DIExpression()) #4, !dbg !995
  %618 = bitcast i8* %614 to i64*, !dbg !1020
  %619 = load i64, i64* %618, align 8, !dbg !1021, !tbaa !1022
  %620 = add i64 %619, 1, !dbg !1021
  store i64 %620, i64* %618, align 8, !dbg !1021, !tbaa !1022
  %621 = getelementptr inbounds i8, i8* %614, i64 8, !dbg !1025
  %622 = bitcast i8* %621 to i64*, !dbg !1025
  %623 = load i64, i64* %622, align 8, !dbg !1026, !tbaa !1027
  %624 = add i64 %617, %623, !dbg !1026
  store i64 %624, i64* %622, align 8, !dbg !1026, !tbaa !1027
  %625 = load i32, i32* %3, align 4, !dbg !1028, !tbaa !618
  call void @llvm.dbg.value(metadata i32 %625, metadata !1001, metadata !DIExpression()) #4, !dbg !995
  br label %626

626:                                              ; preds = %606, %613, %616
  %627 = phi i32 [ 0, %606 ], [ %625, %616 ], [ 0, %613 ], !dbg !995
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %607), !dbg !1029
  br label %648, !dbg !1030

628:                                              ; preds = %602
  %629 = bitcast i32* %2 to i8*, !dbg !1031
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %629), !dbg !1031
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1000, metadata !DIExpression()) #4, !dbg !1031
  call void @llvm.dbg.value(metadata i32 2, metadata !1001, metadata !DIExpression()) #4, !dbg !1031
  store i32 2, i32* %2, align 4, !tbaa !618
  %630 = load i32, i32* %5, align 4, !dbg !1033, !tbaa !403
  call void @llvm.dbg.value(metadata i32 %630, metadata !1002, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #4, !dbg !1031
  %631 = load i32, i32* %9, align 4, !dbg !1034, !tbaa !411
  call void @llvm.dbg.value(metadata i32 %631, metadata !1003, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #4, !dbg !1031
  call void @llvm.dbg.value(metadata i32* %2, metadata !1001, metadata !DIExpression(DW_OP_deref)) #4, !dbg !1031
  %632 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* noundef bitcast (%struct.anon.10* @xdp_stats_map to i8*), i8* noundef nonnull %629) #4, !dbg !1035
  call void @llvm.dbg.value(metadata i8* %632, metadata !1004, metadata !DIExpression()) #4, !dbg !1031
  %633 = icmp eq i8* %632, null, !dbg !1036
  br i1 %633, label %646, label %634, !dbg !1037

634:                                              ; preds = %628
  %635 = zext i32 %631 to i64, !dbg !1038
  call void @llvm.dbg.value(metadata i64 %635, metadata !1003, metadata !DIExpression()) #4, !dbg !1031
  %636 = zext i32 %630 to i64, !dbg !1039
  call void @llvm.dbg.value(metadata i64 %636, metadata !1002, metadata !DIExpression()) #4, !dbg !1031
  call void @llvm.dbg.value(metadata i8* %632, metadata !1004, metadata !DIExpression()) #4, !dbg !1031
  %637 = sub nsw i64 %636, %635, !dbg !1040
  call void @llvm.dbg.value(metadata i64 %637, metadata !1005, metadata !DIExpression()) #4, !dbg !1031
  %638 = bitcast i8* %632 to i64*, !dbg !1041
  %639 = load i64, i64* %638, align 8, !dbg !1042, !tbaa !1022
  %640 = add i64 %639, 1, !dbg !1042
  store i64 %640, i64* %638, align 8, !dbg !1042, !tbaa !1022
  %641 = getelementptr inbounds i8, i8* %632, i64 8, !dbg !1043
  %642 = bitcast i8* %641 to i64*, !dbg !1043
  %643 = load i64, i64* %642, align 8, !dbg !1044, !tbaa !1027
  %644 = add i64 %637, %643, !dbg !1044
  store i64 %644, i64* %642, align 8, !dbg !1044, !tbaa !1027
  %645 = load i32, i32* %2, align 4, !dbg !1045, !tbaa !618
  call void @llvm.dbg.value(metadata i32 %645, metadata !1001, metadata !DIExpression()) #4, !dbg !1031
  br label %646

646:                                              ; preds = %628, %634
  %647 = phi i32 [ %645, %634 ], [ 0, %628 ], !dbg !1031
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %629), !dbg !1046
  br label %648, !dbg !1047

648:                                              ; preds = %88, %29, %646, %626
  %649 = phi i32 [ %627, %626 ], [ %647, %646 ], [ 2, %29 ], [ 2, %88 ], !dbg !401
  ret i32 %649, !dbg !1048
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!396, !397, !398, !399}
!llvm.ident = !{!400}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "filters_map", scope: !2, file: !3, line: 49, type: !384, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !45, globals: !53, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/opt/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "255867b589c5afc8434f5bc5d92b30ae")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 5431, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "5ad8bc925dae1ec87bbb04b3148b183b")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!41 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!42 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!43 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!45 = !{!46, !47, !48, !51}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!47 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !49, line: 24, baseType: !50)
!49 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!50 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !52, line: 25, baseType: !48)
!52 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "52ec79a38e49ac7d1dc9e146ba88a7b1")
!53 = !{!54, !345, !348, !0, !370, !378}
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "____fmt", scope: !56, file: !3, line: 612, type: !340, isLocal: true, isDefinition: true)
!56 = distinct !DISubprogram(name: "xdp_prog_main", scope: !3, file: !3, line: 223, type: !57, scopeLine: 224, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !70)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 5442, size: 192, elements: !62)
!62 = !{!63, !65, !66, !67, !68, !69}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !61, file: !6, line: 5443, baseType: !64, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !49, line: 27, baseType: !7)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !61, file: !6, line: 5444, baseType: !64, size: 32, offset: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !61, file: !6, line: 5445, baseType: !64, size: 32, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !61, file: !6, line: 5447, baseType: !64, size: 32, offset: 96)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !61, file: !6, line: 5448, baseType: !64, size: 32, offset: 128)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !61, file: !6, line: 5450, baseType: !64, size: 32, offset: 160)
!70 = !{!71, !72, !73, !74, !75, !79, !80, !92, !139, !167, !211, !234, !256, !265, !266, !268, !271}
!71 = !DILocalVariable(name: "ctx", arg: 1, scope: !56, file: !3, line: 223, type: !60)
!72 = !DILocalVariable(name: "data_end", scope: !56, file: !3, line: 225, type: !46)
!73 = !DILocalVariable(name: "data", scope: !56, file: !3, line: 226, type: !46)
!74 = !DILocalVariable(name: "action", scope: !56, file: !3, line: 233, type: !64)
!75 = !DILocalVariable(name: "nh", scope: !56, file: !3, line: 236, type: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3, line: 17, size: 64, elements: !77)
!77 = !{!78}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !76, file: !3, line: 18, baseType: !46, size: 64)
!79 = !DILocalVariable(name: "nh_type", scope: !56, file: !3, line: 237, type: !59)
!80 = !DILocalVariable(name: "eth", scope: !56, file: !3, line: 240, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !83, line: 168, size: 112, elements: !84)
!83 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!84 = !{!85, !90, !91}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !82, file: !83, line: 169, baseType: !86, size: 48)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 48, elements: !88)
!87 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!88 = !{!89}
!89 = !DISubrange(count: 6)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !82, file: !83, line: 170, baseType: !86, size: 48, offset: 48)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !82, file: !83, line: 171, baseType: !51, size: 16, offset: 96)
!92 = !DILocalVariable(name: "ip6h", scope: !56, file: !3, line: 241, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !95, line: 118, size: 320, elements: !96)
!95 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "4f074a871dc410c98906d34687654389")
!96 = !{!97, !99, !100, !104, !105, !106, !107}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !94, file: !95, line: 120, baseType: !98, size: 4, flags: DIFlagBitField, extraData: i64 0)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !49, line: 21, baseType: !87)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !94, file: !95, line: 121, baseType: !98, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !94, file: !95, line: 128, baseType: !101, size: 24, offset: 8)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 24, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 3)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !94, file: !95, line: 130, baseType: !51, size: 16, offset: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !94, file: !95, line: 131, baseType: !98, size: 8, offset: 48)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !94, file: !95, line: 132, baseType: !98, size: 8, offset: 56)
!107 = !DIDerivedType(tag: DW_TAG_member, scope: !94, file: !95, line: 134, baseType: !108, size: 256, offset: 64)
!108 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !94, file: !95, line: 134, size: 256, elements: !109)
!109 = !{!110, !134}
!110 = !DIDerivedType(tag: DW_TAG_member, scope: !108, file: !95, line: 134, baseType: !111, size: 256)
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !108, file: !95, line: 134, size: 256, elements: !112)
!112 = !{!113, !133}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !111, file: !95, line: 134, baseType: !114, size: 128)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !115, line: 33, size: 128, elements: !116)
!115 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "8bebb780b45d3fe932cc1d934fa5f5fe")
!116 = !{!117}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !114, file: !115, line: 40, baseType: !118, size: 128)
!118 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !114, file: !115, line: 34, size: 128, elements: !119)
!119 = !{!120, !124, !128}
!120 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !118, file: !115, line: 35, baseType: !121, size: 128)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 128, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 16)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !118, file: !115, line: 37, baseType: !125, size: 128)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 8)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !118, file: !115, line: 38, baseType: !129, size: 128)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 128, elements: !131)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !52, line: 27, baseType: !64)
!131 = !{!132}
!132 = !DISubrange(count: 4)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !111, file: !95, line: 134, baseType: !114, size: 128, offset: 128)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !108, file: !95, line: 134, baseType: !135, size: 256)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !108, file: !95, line: 134, size: 256, elements: !136)
!136 = !{!137, !138}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !135, file: !95, line: 134, baseType: !114, size: 128)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !135, file: !95, line: 134, baseType: !114, size: 128, offset: 128)
!139 = !DILocalVariable(name: "iph", scope: !56, file: !3, line: 242, type: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !142, line: 87, size: 160, elements: !143)
!142 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!143 = !{!144, !145, !146, !147, !148, !149, !150, !151, !152, !154}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !141, file: !142, line: 89, baseType: !98, size: 4, flags: DIFlagBitField, extraData: i64 0)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !141, file: !142, line: 90, baseType: !98, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !141, file: !142, line: 97, baseType: !98, size: 8, offset: 8)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !141, file: !142, line: 98, baseType: !51, size: 16, offset: 16)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !141, file: !142, line: 99, baseType: !51, size: 16, offset: 32)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !141, file: !142, line: 100, baseType: !51, size: 16, offset: 48)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !141, file: !142, line: 101, baseType: !98, size: 8, offset: 64)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !141, file: !142, line: 102, baseType: !98, size: 8, offset: 72)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !141, file: !142, line: 103, baseType: !153, size: 16, offset: 80)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !52, line: 31, baseType: !48)
!154 = !DIDerivedType(tag: DW_TAG_member, scope: !141, file: !142, line: 104, baseType: !155, size: 64, offset: 96)
!155 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !141, file: !142, line: 104, size: 64, elements: !156)
!156 = !{!157, !162}
!157 = !DIDerivedType(tag: DW_TAG_member, scope: !155, file: !142, line: 104, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !142, line: 104, size: 64, elements: !159)
!159 = !{!160, !161}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !158, file: !142, line: 104, baseType: !130, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !158, file: !142, line: 104, baseType: !130, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !155, file: !142, line: 104, baseType: !163, size: 64)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !155, file: !142, line: 104, size: 64, elements: !164)
!164 = !{!165, !166}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !163, file: !142, line: 104, baseType: !130, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !163, file: !142, line: 104, baseType: !130, size: 32, offset: 32)
!167 = !DILocalVariable(name: "icmp6h", scope: !56, file: !3, line: 243, type: !168)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !170, line: 8, size: 64, elements: !171)
!170 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!171 = !{!172, !173, !174, !175}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !169, file: !170, line: 10, baseType: !98, size: 8)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !169, file: !170, line: 11, baseType: !98, size: 8, offset: 8)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !169, file: !170, line: 12, baseType: !153, size: 16, offset: 16)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !169, file: !170, line: 63, baseType: !176, size: 32, offset: 32)
!176 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !169, file: !170, line: 15, size: 32, elements: !177)
!177 = !{!178, !182, !186, !188, !193, !201}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !176, file: !170, line: 16, baseType: !179, size: 32)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !130, size: 32, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 1)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !176, file: !170, line: 17, baseType: !183, size: 32)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 32, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 2)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !176, file: !170, line: 18, baseType: !187, size: 32)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 32, elements: !131)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !176, file: !170, line: 23, baseType: !189, size: 32)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !170, line: 20, size: 32, elements: !190)
!190 = !{!191, !192}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !189, file: !170, line: 21, baseType: !51, size: 16)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !189, file: !170, line: 22, baseType: !51, size: 16, offset: 16)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !176, file: !170, line: 40, baseType: !194, size: 32)
!194 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !170, line: 25, size: 32, elements: !195)
!195 = !{!196, !197, !198, !199, !200}
!196 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !194, file: !170, line: 27, baseType: !64, size: 5, flags: DIFlagBitField, extraData: i64 0)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !194, file: !170, line: 28, baseType: !64, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !194, file: !170, line: 29, baseType: !64, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !194, file: !170, line: 30, baseType: !64, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !194, file: !170, line: 31, baseType: !64, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !176, file: !170, line: 61, baseType: !202, size: 32)
!202 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !170, line: 42, size: 32, elements: !203)
!203 = !{!204, !205, !206, !207, !208, !209, !210}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !202, file: !170, line: 43, baseType: !98, size: 8)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !202, file: !170, line: 45, baseType: !98, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !202, file: !170, line: 46, baseType: !98, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !202, file: !170, line: 47, baseType: !98, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !202, file: !170, line: 48, baseType: !98, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !202, file: !170, line: 49, baseType: !98, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !202, file: !170, line: 60, baseType: !51, size: 16, offset: 16)
!211 = !DILocalVariable(name: "icmph", scope: !56, file: !3, line: 244, type: !212)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !214, line: 89, size: 64, elements: !215)
!214 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!215 = !{!216, !217, !218, !219}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !213, file: !214, line: 90, baseType: !98, size: 8)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !213, file: !214, line: 91, baseType: !98, size: 8, offset: 8)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !213, file: !214, line: 92, baseType: !153, size: 16, offset: 16)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !213, file: !214, line: 104, baseType: !220, size: 32, offset: 32)
!220 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !213, file: !214, line: 93, size: 32, elements: !221)
!221 = !{!222, !227, !228, !233}
!222 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !220, file: !214, line: 97, baseType: !223, size: 32)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !220, file: !214, line: 94, size: 32, elements: !224)
!224 = !{!225, !226}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !223, file: !214, line: 95, baseType: !51, size: 16)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !223, file: !214, line: 96, baseType: !51, size: 16, offset: 16)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !220, file: !214, line: 98, baseType: !130, size: 32)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !220, file: !214, line: 102, baseType: !229, size: 32)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !220, file: !214, line: 99, size: 32, elements: !230)
!230 = !{!231, !232}
!231 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !229, file: !214, line: 100, baseType: !51, size: 16)
!232 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !229, file: !214, line: 101, baseType: !51, size: 16, offset: 16)
!233 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !220, file: !214, line: 103, baseType: !187, size: 32)
!234 = !DILocalVariable(name: "tcph", scope: !56, file: !3, line: 245, type: !235)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !237, line: 25, size: 160, elements: !238)
!237 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!238 = !{!239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255}
!239 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !236, file: !237, line: 26, baseType: !51, size: 16)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !236, file: !237, line: 27, baseType: !51, size: 16, offset: 16)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !236, file: !237, line: 28, baseType: !130, size: 32, offset: 32)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !236, file: !237, line: 29, baseType: !130, size: 32, offset: 64)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !236, file: !237, line: 31, baseType: !48, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !236, file: !237, line: 32, baseType: !48, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !236, file: !237, line: 33, baseType: !48, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !236, file: !237, line: 34, baseType: !48, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !236, file: !237, line: 35, baseType: !48, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !236, file: !237, line: 36, baseType: !48, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !236, file: !237, line: 37, baseType: !48, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !236, file: !237, line: 38, baseType: !48, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !236, file: !237, line: 39, baseType: !48, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !236, file: !237, line: 40, baseType: !48, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !236, file: !237, line: 55, baseType: !51, size: 16, offset: 112)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !236, file: !237, line: 56, baseType: !153, size: 16, offset: 128)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !236, file: !237, line: 57, baseType: !51, size: 16, offset: 144)
!256 = !DILocalVariable(name: "udph", scope: !56, file: !3, line: 246, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !259, line: 23, size: 64, elements: !260)
!259 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "", checksumkind: CSK_MD5, checksum: "53c0d42e1bf6d93b39151764be2d20fb")
!260 = !{!261, !262, !263, !264}
!261 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !258, file: !259, line: 24, baseType: !51, size: 16)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !258, file: !259, line: 25, baseType: !51, size: 16, offset: 16)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !258, file: !259, line: 26, baseType: !51, size: 16, offset: 32)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !258, file: !259, line: 27, baseType: !153, size: 16, offset: 48)
!265 = !DILocalVariable(name: "flag", scope: !56, file: !3, line: 249, type: !59)
!266 = !DILocalVariable(name: "i", scope: !267, file: !3, line: 353, type: !98)
!267 = distinct !DILexicalBlock(scope: !56, file: !3, line: 353, column: 2)
!268 = !DILocalVariable(name: "key", scope: !269, file: !3, line: 355, type: !64)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 354, column: 2)
!270 = distinct !DILexicalBlock(scope: !267, file: !3, line: 353, column: 2)
!271 = !DILocalVariable(name: "filter", scope: !269, file: !3, line: 356, type: !272)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "filter", file: !274, line: 124, size: 704, elements: !275)
!274 = !DIFile(filename: "./xdpfw.h", directory: "/opt/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "a4cd2523f7654f0445c9de9faf4c3ff4")
!275 = !{!276, !277, !278, !279, !280, !281, !282, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !300, !324, !332}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !273, file: !274, line: 126, baseType: !64, size: 32)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !273, file: !274, line: 127, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "action", scope: !273, file: !274, line: 129, baseType: !98, size: 8, offset: 40)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "ip_enabled", scope: !273, file: !274, line: 131, baseType: !7, size: 1, offset: 48, flags: DIFlagBitField, extraData: i64 48)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "srcip", scope: !273, file: !274, line: 132, baseType: !64, size: 32, offset: 64)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "dstip", scope: !273, file: !274, line: 133, baseType: !64, size: 32, offset: 96)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "srcip6", scope: !273, file: !274, line: 135, baseType: !283, size: 128, offset: 128)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 128, elements: !131)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "dstip6", scope: !273, file: !274, line: 136, baseType: !283, size: 128, offset: 256)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "do_min_ttl", scope: !273, file: !274, line: 138, baseType: !7, size: 1, offset: 384, flags: DIFlagBitField, extraData: i64 384)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "min_ttl", scope: !273, file: !274, line: 139, baseType: !98, size: 8, offset: 392)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "do_max_ttl", scope: !273, file: !274, line: 141, baseType: !7, size: 1, offset: 400, flags: DIFlagBitField, extraData: i64 400)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "max_ttl", scope: !273, file: !274, line: 142, baseType: !98, size: 8, offset: 408)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "do_min_len", scope: !273, file: !274, line: 144, baseType: !7, size: 1, offset: 416, flags: DIFlagBitField, extraData: i64 416)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "min_len", scope: !273, file: !274, line: 145, baseType: !48, size: 16, offset: 432)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "do_max_len", scope: !273, file: !274, line: 147, baseType: !7, size: 1, offset: 448, flags: DIFlagBitField, extraData: i64 448)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "max_len", scope: !273, file: !274, line: 148, baseType: !48, size: 16, offset: 464)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "do_tos", scope: !273, file: !274, line: 150, baseType: !7, size: 1, offset: 480, flags: DIFlagBitField, extraData: i64 480)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !273, file: !274, line: 151, baseType: !295, size: 8, offset: 488)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !296, line: 24, baseType: !297)
!296 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!297 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !298, line: 37, baseType: !299)
!298 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!299 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "tcpopts", scope: !273, file: !274, line: 153, baseType: !301, size: 96, offset: 512)
!301 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcpopts", file: !274, line: 67, size: 96, elements: !302)
!302 = !{!303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323}
!303 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !301, file: !274, line: 69, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "do_sport", scope: !301, file: !274, line: 71, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !301, file: !274, line: 72, baseType: !48, size: 16, offset: 16)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "do_dport", scope: !301, file: !274, line: 74, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !301, file: !274, line: 75, baseType: !48, size: 16, offset: 48)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "do_urg", scope: !301, file: !274, line: 77, baseType: !7, size: 1, offset: 64, flags: DIFlagBitField, extraData: i64 64)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !301, file: !274, line: 78, baseType: !7, size: 1, offset: 65, flags: DIFlagBitField, extraData: i64 64)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "do_ack", scope: !301, file: !274, line: 80, baseType: !7, size: 1, offset: 66, flags: DIFlagBitField, extraData: i64 64)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !301, file: !274, line: 81, baseType: !7, size: 1, offset: 67, flags: DIFlagBitField, extraData: i64 64)
!312 = !DIDerivedType(tag: DW_TAG_member, name: "do_rst", scope: !301, file: !274, line: 83, baseType: !7, size: 1, offset: 68, flags: DIFlagBitField, extraData: i64 64)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !301, file: !274, line: 84, baseType: !7, size: 1, offset: 69, flags: DIFlagBitField, extraData: i64 64)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "do_psh", scope: !301, file: !274, line: 86, baseType: !7, size: 1, offset: 70, flags: DIFlagBitField, extraData: i64 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !301, file: !274, line: 87, baseType: !7, size: 1, offset: 71, flags: DIFlagBitField, extraData: i64 64)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "do_syn", scope: !301, file: !274, line: 89, baseType: !7, size: 1, offset: 72, flags: DIFlagBitField, extraData: i64 64)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !301, file: !274, line: 90, baseType: !7, size: 1, offset: 73, flags: DIFlagBitField, extraData: i64 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "do_fin", scope: !301, file: !274, line: 92, baseType: !7, size: 1, offset: 74, flags: DIFlagBitField, extraData: i64 64)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !301, file: !274, line: 93, baseType: !7, size: 1, offset: 75, flags: DIFlagBitField, extraData: i64 64)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "do_ece", scope: !301, file: !274, line: 95, baseType: !7, size: 1, offset: 76, flags: DIFlagBitField, extraData: i64 64)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !301, file: !274, line: 96, baseType: !7, size: 1, offset: 77, flags: DIFlagBitField, extraData: i64 64)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "do_cwr", scope: !301, file: !274, line: 98, baseType: !7, size: 1, offset: 78, flags: DIFlagBitField, extraData: i64 64)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !301, file: !274, line: 99, baseType: !7, size: 1, offset: 79, flags: DIFlagBitField, extraData: i64 64)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "udpopts", scope: !273, file: !274, line: 154, baseType: !325, size: 64, offset: 608)
!325 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udpopts", file: !274, line: 102, size: 64, elements: !326)
!326 = !{!327, !328, !329, !330, !331}
!327 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !325, file: !274, line: 104, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "do_sport", scope: !325, file: !274, line: 106, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !325, file: !274, line: 107, baseType: !48, size: 16, offset: 16)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "do_dport", scope: !325, file: !274, line: 109, baseType: !7, size: 1, offset: 32, flags: DIFlagBitField, extraData: i64 32)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !325, file: !274, line: 110, baseType: !48, size: 16, offset: 48)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "icmpopts", scope: !273, file: !274, line: 155, baseType: !333, size: 32, offset: 672)
!333 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpopts", file: !274, line: 113, size: 32, elements: !334)
!334 = !{!335, !336, !337, !338, !339}
!335 = !DIDerivedType(tag: DW_TAG_member, name: "enabled", scope: !333, file: !274, line: 115, baseType: !7, size: 1, flags: DIFlagBitField, extraData: i64 0)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "do_code", scope: !333, file: !274, line: 117, baseType: !7, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !333, file: !274, line: 118, baseType: !98, size: 8, offset: 8)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "do_type", scope: !333, file: !274, line: 120, baseType: !7, size: 1, offset: 16, flags: DIFlagBitField, extraData: i64 16)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !333, file: !274, line: 121, baseType: !98, size: 8, offset: 24)
!340 = !DICompositeType(tag: DW_TAG_array_type, baseType: !341, size: 176, elements: !343)
!341 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !342)
!342 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!343 = !{!344}
!344 = !DISubrange(count: 22)
!345 = !DIGlobalVariableExpression(var: !346, expr: !DIExpression())
!346 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 634, type: !347, isLocal: false, isDefinition: true)
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !342, size: 32, elements: !131)
!348 = !DIGlobalVariableExpression(var: !349, expr: !DIExpression())
!349 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 41, type: !350, isLocal: false, isDefinition: true)
!350 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 36, size: 256, elements: !351)
!351 = !{!352, !355, !357, !365}
!352 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !350, file: !3, line: 37, baseType: !353, size: 64)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 192, elements: !88)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !350, file: !3, line: 38, baseType: !356, size: 64, offset: 64)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !350, file: !3, line: 39, baseType: !358, size: 64, offset: 128)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!359 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !274, line: 53, size: 128, elements: !360)
!360 = !{!361, !364}
!361 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !359, file: !274, line: 54, baseType: !362, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !49, line: 31, baseType: !363)
!363 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !359, file: !274, line: 55, baseType: !362, size: 64, offset: 64)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !350, file: !3, line: 40, baseType: !366, size: 64, offset: 192)
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !367, size: 64)
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 160, elements: !368)
!368 = !{!369}
!369 = !DISubrange(count: 5)
!370 = !DIGlobalVariableExpression(var: !371, expr: !DIExpression())
!371 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !372, line: 56, type: !373, isLocal: true, isDefinition: true)
!372 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/opt/web-ebpf-xdp/ebpf-xdp/src", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64)
!374 = !DISubroutineType(types: !375)
!375 = !{!46, !46, !376}
!376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !377, size: 64)
!377 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!378 = !DIGlobalVariableExpression(var: !379, expr: !DIExpression())
!379 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !372, line: 177, type: !380, isLocal: true, isDefinition: true)
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !381, size: 64)
!381 = !DISubroutineType(types: !382)
!382 = !{!47, !383, !64, null}
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!384 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 43, size: 256, elements: !385)
!385 = !{!386, !389, !394, !395}
!386 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !384, file: !3, line: 45, baseType: !387, size: 64)
!387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !388, size: 64)
!388 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 64, elements: !184)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !384, file: !3, line: 46, baseType: !390, size: 64, offset: 64)
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64)
!391 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 2560, elements: !392)
!392 = !{!393}
!393 = !DISubrange(count: 80)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !384, file: !3, line: 47, baseType: !356, size: 64, offset: 128)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !384, file: !3, line: 48, baseType: !272, size: 64, offset: 192)
!396 = !{i32 7, !"Dwarf Version", i32 5}
!397 = !{i32 2, !"Debug Info Version", i32 3}
!398 = !{i32 1, !"wchar_size", i32 4}
!399 = !{i32 7, !"frame-pointer", i32 2}
!400 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!401 = !DILocation(line: 0, scope: !56)
!402 = !DILocation(line: 225, column: 38, scope: !56)
!403 = !{!404, !405, i64 4}
!404 = !{!"xdp_md", !405, i64 0, !405, i64 4, !405, i64 8, !405, i64 12, !405, i64 16, !405, i64 20}
!405 = !{!"int", !406, i64 0}
!406 = !{!"omnipotent char", !407, i64 0}
!407 = !{!"Simple C/C++ TBAA"}
!408 = !DILocation(line: 225, column: 27, scope: !56)
!409 = !DILocation(line: 225, column: 19, scope: !56)
!410 = !DILocation(line: 226, column: 34, scope: !56)
!411 = !{!404, !405, i64 0}
!412 = !DILocation(line: 226, column: 23, scope: !56)
!413 = !DILocation(line: 226, column: 15, scope: !56)
!414 = !DILocalVariable(name: "nh", arg: 1, scope: !415, file: !3, line: 51, type: !418)
!415 = distinct !DISubprogram(name: "parse_ethhdr", scope: !3, file: !3, line: 51, type: !416, scopeLine: 54, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !420)
!416 = !DISubroutineType(types: !417)
!417 = !{!59, !418, !46, !419}
!418 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!419 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!420 = !{!414, !421, !422, !423, !424}
!421 = !DILocalVariable(name: "data_end", arg: 2, scope: !415, file: !3, line: 52, type: !46)
!422 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !415, file: !3, line: 53, type: !419)
!423 = !DILocalVariable(name: "eth", scope: !415, file: !3, line: 55, type: !81)
!424 = !DILocalVariable(name: "hdrsize", scope: !415, file: !3, line: 56, type: !59)
!425 = !DILocation(line: 0, scope: !415, inlinedAt: !426)
!426 = distinct !DILocation(line: 259, column: 15, scope: !56)
!427 = !DILocation(line: 61, column: 10, scope: !428, inlinedAt: !426)
!428 = distinct !DILexicalBlock(scope: !415, file: !3, line: 61, column: 6)
!429 = !DILocation(line: 61, column: 14, scope: !428, inlinedAt: !426)
!430 = !DILocation(line: 61, column: 6, scope: !415, inlinedAt: !426)
!431 = !DILocation(line: 67, column: 14, scope: !415, inlinedAt: !426)
!432 = !{!433, !434, i64 12}
!433 = !{!"ethhdr", !406, i64 0, !406, i64 6, !434, i64 12}
!434 = !{!"short", !406, i64 0}
!435 = !DILocation(line: 261, column: 6, scope: !56)
!436 = !DILocalVariable(name: "nh", arg: 1, scope: !437, file: !3, line: 70, type: !418)
!437 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !3, file: !3, line: 70, type: !438, scopeLine: 73, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !441)
!438 = !DISubroutineType(types: !439)
!439 = !{!59, !418, !46, !440}
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!441 = !{!436, !442, !443, !444}
!442 = !DILocalVariable(name: "data_end", arg: 2, scope: !437, file: !3, line: 71, type: !46)
!443 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !437, file: !3, line: 72, type: !440)
!444 = !DILocalVariable(name: "ip6h", scope: !437, file: !3, line: 74, type: !93)
!445 = !DILocation(line: 0, scope: !437, inlinedAt: !446)
!446 = distinct !DILocation(line: 263, column: 13, scope: !447)
!447 = distinct !DILexicalBlock(scope: !448, file: !3, line: 261, column: 40)
!448 = distinct !DILexicalBlock(scope: !56, file: !3, line: 261, column: 6)
!449 = !DILocation(line: 80, column: 11, scope: !450, inlinedAt: !446)
!450 = distinct !DILexicalBlock(scope: !437, file: !3, line: 80, column: 6)
!451 = !DILocation(line: 80, column: 17, scope: !450, inlinedAt: !446)
!452 = !DILocation(line: 80, column: 15, scope: !450, inlinedAt: !446)
!453 = !DILocation(line: 80, column: 6, scope: !437, inlinedAt: !446)
!454 = !DILocation(line: 74, column: 29, scope: !437, inlinedAt: !446)
!455 = !DILocation(line: 86, column: 15, scope: !437, inlinedAt: !446)
!456 = !{!457, !406, i64 6}
!457 = !{!"ipv6hdr", !406, i64 0, !406, i64 0, !406, i64 1, !434, i64 4, !406, i64 6, !406, i64 7, !406, i64 8}
!458 = !DILocation(line: 86, column: 9, scope: !437, inlinedAt: !446)
!459 = !DILocation(line: 86, column: 2, scope: !437, inlinedAt: !446)
!460 = !DILocation(line: 264, column: 6, scope: !461)
!461 = distinct !DILexicalBlock(scope: !447, file: !3, line: 264, column: 6)
!462 = !DILocation(line: 264, column: 11, scope: !461)
!463 = !DILocation(line: 279, column: 3, scope: !447)
!464 = !DILocalVariable(name: "nh", arg: 1, scope: !465, file: !3, line: 164, type: !418)
!465 = distinct !DISubprogram(name: "parse_tcphdr", scope: !3, file: !3, line: 164, type: !466, scopeLine: 167, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !469)
!466 = !DISubroutineType(types: !467)
!467 = !{!59, !418, !46, !468}
!468 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!469 = !{!464, !470, !471, !472, !473}
!470 = !DILocalVariable(name: "data_end", arg: 2, scope: !465, file: !3, line: 165, type: !46)
!471 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !465, file: !3, line: 166, type: !468)
!472 = !DILocalVariable(name: "len", scope: !465, file: !3, line: 168, type: !59)
!473 = !DILocalVariable(name: "h", scope: !465, file: !3, line: 169, type: !235)
!474 = !DILocation(line: 0, scope: !465, inlinedAt: !475)
!475 = distinct !DILocation(line: 283, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !447, file: !3, line: 280, column: 9)
!477 = !DILocation(line: 171, column: 8, scope: !478, inlinedAt: !475)
!478 = distinct !DILexicalBlock(scope: !465, file: !3, line: 171, column: 6)
!479 = !DILocation(line: 171, column: 12, scope: !478, inlinedAt: !475)
!480 = !DILocation(line: 171, column: 6, scope: !465, inlinedAt: !475)
!481 = !DILocation(line: 174, column: 11, scope: !465, inlinedAt: !475)
!482 = !DILocation(line: 174, column: 16, scope: !465, inlinedAt: !475)
!483 = !DILocation(line: 176, column: 9, scope: !484, inlinedAt: !475)
!484 = distinct !DILexicalBlock(scope: !465, file: !3, line: 176, column: 5)
!485 = !DILocation(line: 176, column: 5, scope: !465, inlinedAt: !475)
!486 = !DILocation(line: 180, column: 14, scope: !487, inlinedAt: !475)
!487 = distinct !DILexicalBlock(scope: !465, file: !3, line: 180, column: 6)
!488 = !DILocation(line: 180, column: 20, scope: !487, inlinedAt: !475)
!489 = !DILocation(line: 180, column: 6, scope: !465, inlinedAt: !475)
!490 = !DILocation(line: 188, column: 10, scope: !465, inlinedAt: !475)
!491 = !DILocation(line: 190, column: 2, scope: !465, inlinedAt: !475)
!492 = !DILocalVariable(name: "nh", arg: 1, scope: !493, file: !3, line: 144, type: !418)
!493 = distinct !DISubprogram(name: "parse_udphdr", scope: !3, file: !3, line: 144, type: !494, scopeLine: 147, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !497)
!494 = !DISubroutineType(types: !495)
!495 = !{!59, !418, !46, !496}
!496 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!497 = !{!492, !498, !499, !500, !501}
!498 = !DILocalVariable(name: "data_end", arg: 2, scope: !493, file: !3, line: 145, type: !46)
!499 = !DILocalVariable(name: "udphdr", arg: 3, scope: !493, file: !3, line: 146, type: !496)
!500 = !DILocalVariable(name: "len", scope: !493, file: !3, line: 148, type: !59)
!501 = !DILocalVariable(name: "h", scope: !493, file: !3, line: 149, type: !257)
!502 = !DILocation(line: 0, scope: !493, inlinedAt: !503)
!503 = distinct !DILocation(line: 293, column: 17, scope: !476)
!504 = !DILocation(line: 151, column: 8, scope: !505, inlinedAt: !503)
!505 = distinct !DILexicalBlock(scope: !493, file: !3, line: 151, column: 6)
!506 = !DILocation(line: 151, column: 14, scope: !505, inlinedAt: !503)
!507 = !DILocation(line: 151, column: 12, scope: !505, inlinedAt: !503)
!508 = !DILocation(line: 151, column: 6, scope: !493, inlinedAt: !503)
!509 = !DILocation(line: 149, column: 25, scope: !493, inlinedAt: !503)
!510 = !DILocation(line: 158, column: 6, scope: !493, inlinedAt: !503)
!511 = !DILocalVariable(name: "nh", arg: 1, scope: !512, file: !3, line: 89, type: !418)
!512 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !3, file: !3, line: 89, type: !513, scopeLine: 92, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !516)
!513 = !DISubroutineType(types: !514)
!514 = !{!59, !418, !46, !515}
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!516 = !{!511, !517, !518, !519}
!517 = !DILocalVariable(name: "data_end", arg: 2, scope: !512, file: !3, line: 90, type: !46)
!518 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !512, file: !3, line: 91, type: !515)
!519 = !DILocalVariable(name: "icmp6h", scope: !512, file: !3, line: 93, type: !168)
!520 = !DILocation(line: 0, scope: !512, inlinedAt: !521)
!521 = distinct !DILocation(line: 301, column: 17, scope: !476)
!522 = !DILocation(line: 95, column: 13, scope: !523, inlinedAt: !521)
!523 = distinct !DILexicalBlock(scope: !512, file: !3, line: 95, column: 6)
!524 = !DILocation(line: 95, column: 19, scope: !523, inlinedAt: !521)
!525 = !DILocation(line: 95, column: 17, scope: !523, inlinedAt: !521)
!526 = !DILocation(line: 95, column: 6, scope: !512, inlinedAt: !521)
!527 = !DILocation(line: 93, column: 32, scope: !512, inlinedAt: !521)
!528 = !DILocation(line: 101, column: 2, scope: !512, inlinedAt: !521)
!529 = !DILocalVariable(name: "nh", arg: 1, scope: !530, file: !3, line: 104, type: !418)
!530 = distinct !DISubprogram(name: "parse_iphdr", scope: !3, file: !3, line: 104, type: !531, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !534)
!531 = !DISubroutineType(types: !532)
!532 = !{!59, !418, !46, !533}
!533 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!534 = !{!529, !535, !536, !537, !538}
!535 = !DILocalVariable(name: "data_end", arg: 2, scope: !530, file: !3, line: 105, type: !46)
!536 = !DILocalVariable(name: "iphdr", arg: 3, scope: !530, file: !3, line: 106, type: !533)
!537 = !DILocalVariable(name: "iph", scope: !530, file: !3, line: 108, type: !140)
!538 = !DILocalVariable(name: "hdrsize", scope: !530, file: !3, line: 109, type: !59)
!539 = !DILocation(line: 0, scope: !530, inlinedAt: !540)
!540 = distinct !DILocation(line: 308, column: 13, scope: !541)
!541 = distinct !DILexicalBlock(scope: !542, file: !3, line: 306, column: 45)
!542 = distinct !DILexicalBlock(scope: !448, file: !3, line: 306, column: 13)
!543 = !DILocation(line: 111, column: 10, scope: !544, inlinedAt: !540)
!544 = distinct !DILexicalBlock(scope: !530, file: !3, line: 111, column: 6)
!545 = !DILocation(line: 111, column: 14, scope: !544, inlinedAt: !540)
!546 = !DILocation(line: 111, column: 6, scope: !530, inlinedAt: !540)
!547 = !DILocation(line: 114, column: 17, scope: !530, inlinedAt: !540)
!548 = !DILocation(line: 114, column: 21, scope: !530, inlinedAt: !540)
!549 = !DILocation(line: 116, column: 13, scope: !550, inlinedAt: !540)
!550 = distinct !DILexicalBlock(scope: !530, file: !3, line: 116, column: 5)
!551 = !DILocation(line: 116, column: 5, scope: !530, inlinedAt: !540)
!552 = !DILocation(line: 120, column: 14, scope: !553, inlinedAt: !540)
!553 = distinct !DILexicalBlock(scope: !530, file: !3, line: 120, column: 6)
!554 = !DILocation(line: 120, column: 24, scope: !553, inlinedAt: !540)
!555 = !DILocation(line: 120, column: 6, scope: !530, inlinedAt: !540)
!556 = !DILocation(line: 124, column: 9, scope: !530, inlinedAt: !540)
!557 = !DILocation(line: 126, column: 14, scope: !530, inlinedAt: !540)
!558 = !{!559, !406, i64 9}
!559 = !{!"iphdr", !406, i64 0, !406, i64 0, !406, i64 1, !434, i64 2, !434, i64 4, !434, i64 6, !406, i64 8, !406, i64 9, !434, i64 10, !406, i64 12}
!560 = !DILocation(line: 126, column: 9, scope: !530, inlinedAt: !540)
!561 = !DILocation(line: 126, column: 2, scope: !530, inlinedAt: !540)
!562 = !DILocation(line: 309, column: 6, scope: !563)
!563 = distinct !DILexicalBlock(scope: !541, file: !3, line: 309, column: 6)
!564 = !DILocation(line: 309, column: 10, scope: !563)
!565 = !DILocation(line: 325, column: 3, scope: !541)
!566 = !DILocation(line: 0, scope: !465, inlinedAt: !567)
!567 = distinct !DILocation(line: 329, column: 17, scope: !568)
!568 = distinct !DILexicalBlock(scope: !541, file: !3, line: 326, column: 9)
!569 = !DILocation(line: 171, column: 8, scope: !478, inlinedAt: !567)
!570 = !DILocation(line: 171, column: 12, scope: !478, inlinedAt: !567)
!571 = !DILocation(line: 171, column: 6, scope: !465, inlinedAt: !567)
!572 = !DILocation(line: 174, column: 11, scope: !465, inlinedAt: !567)
!573 = !DILocation(line: 174, column: 16, scope: !465, inlinedAt: !567)
!574 = !DILocation(line: 176, column: 9, scope: !484, inlinedAt: !567)
!575 = !DILocation(line: 176, column: 5, scope: !465, inlinedAt: !567)
!576 = !DILocation(line: 180, column: 14, scope: !487, inlinedAt: !567)
!577 = !DILocation(line: 180, column: 20, scope: !487, inlinedAt: !567)
!578 = !DILocation(line: 180, column: 6, scope: !465, inlinedAt: !567)
!579 = !DILocation(line: 188, column: 10, scope: !465, inlinedAt: !567)
!580 = !DILocation(line: 190, column: 2, scope: !465, inlinedAt: !567)
!581 = !DILocation(line: 0, scope: !493, inlinedAt: !582)
!582 = distinct !DILocation(line: 335, column: 17, scope: !568)
!583 = !DILocation(line: 151, column: 8, scope: !505, inlinedAt: !582)
!584 = !DILocation(line: 151, column: 14, scope: !505, inlinedAt: !582)
!585 = !DILocation(line: 151, column: 12, scope: !505, inlinedAt: !582)
!586 = !DILocation(line: 151, column: 6, scope: !493, inlinedAt: !582)
!587 = !DILocation(line: 149, column: 25, scope: !493, inlinedAt: !582)
!588 = !DILocation(line: 158, column: 6, scope: !493, inlinedAt: !582)
!589 = !DILocalVariable(name: "nh", arg: 1, scope: !590, file: !3, line: 129, type: !418)
!590 = distinct !DISubprogram(name: "parse_icmphdr", scope: !3, file: !3, line: 129, type: !591, scopeLine: 132, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !594)
!591 = !DISubroutineType(types: !592)
!592 = !{!59, !418, !46, !593}
!593 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!594 = !{!589, !595, !596, !597}
!595 = !DILocalVariable(name: "data_end", arg: 2, scope: !590, file: !3, line: 130, type: !46)
!596 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !590, file: !3, line: 131, type: !593)
!597 = !DILocalVariable(name: "icmph", scope: !590, file: !3, line: 133, type: !212)
!598 = !DILocation(line: 0, scope: !590, inlinedAt: !599)
!599 = distinct !DILocation(line: 344, column: 17, scope: !568)
!600 = !DILocation(line: 135, column: 12, scope: !601, inlinedAt: !599)
!601 = distinct !DILexicalBlock(scope: !590, file: !3, line: 135, column: 6)
!602 = !DILocation(line: 135, column: 18, scope: !601, inlinedAt: !599)
!603 = !DILocation(line: 135, column: 16, scope: !601, inlinedAt: !599)
!604 = !DILocation(line: 135, column: 6, scope: !590, inlinedAt: !599)
!605 = !DILocation(line: 133, column: 30, scope: !590, inlinedAt: !599)
!606 = !DILocation(line: 141, column: 2, scope: !590, inlinedAt: !599)
!607 = !DILocation(line: 241, column: 18, scope: !56)
!608 = !DILocation(line: 242, column: 16, scope: !56)
!609 = !DILocation(line: 243, column: 19, scope: !56)
!610 = !DILocation(line: 244, column: 18, scope: !56)
!611 = !DILocation(line: 245, column: 17, scope: !56)
!612 = !DILocation(line: 246, column: 17, scope: !56)
!613 = !DILocation(line: 0, scope: !267)
!614 = !DILocation(line: 353, column: 2, scope: !267)
!615 = !DILocation(line: 355, column: 3, scope: !269)
!616 = !DILocation(line: 0, scope: !269)
!617 = !DILocation(line: 355, column: 9, scope: !269)
!618 = !{!405, !405, i64 0}
!619 = !DILocation(line: 356, column: 27, scope: !269)
!620 = !DILocation(line: 361, column: 14, scope: !621)
!621 = distinct !DILexicalBlock(scope: !269, file: !3, line: 361, column: 13)
!622 = !DILocation(line: 361, column: 21, scope: !621)
!623 = !DILocation(line: 361, column: 32, scope: !621)
!624 = !DILocation(line: 371, column: 22, scope: !625)
!625 = distinct !DILexicalBlock(scope: !269, file: !3, line: 371, column: 13)
!626 = !DILocation(line: 371, column: 14, scope: !625)
!627 = !DILocation(line: 371, column: 13, scope: !269)
!628 = !DILocation(line: 377, column: 13, scope: !269)
!629 = !DILocation(line: 380, column: 25, scope: !630)
!630 = distinct !DILexicalBlock(scope: !631, file: !3, line: 380, column: 17)
!631 = distinct !DILexicalBlock(scope: !632, file: !3, line: 378, column: 9)
!632 = distinct !DILexicalBlock(scope: !269, file: !3, line: 377, column: 13)
!633 = !DILocation(line: 380, column: 17, scope: !630)
!634 = !DILocation(line: 380, column: 34, scope: !630)
!635 = !DILocation(line: 380, column: 39, scope: !630)
!636 = !DILocation(line: 380, column: 43, scope: !630)
!637 = !{!406, !406, i64 0}
!638 = !DILocation(line: 380, column: 74, scope: !630)
!639 = !DILocation(line: 380, column: 95, scope: !630)
!640 = !DILocation(line: 380, column: 98, scope: !630)
!641 = !DILocation(line: 380, column: 132, scope: !630)
!642 = !DILocation(line: 380, column: 129, scope: !630)
!643 = !DILocation(line: 380, column: 150, scope: !630)
!644 = !DILocation(line: 380, column: 153, scope: !630)
!645 = !DILocation(line: 380, column: 187, scope: !630)
!646 = !DILocation(line: 380, column: 184, scope: !630)
!647 = !DILocation(line: 380, column: 205, scope: !630)
!648 = !DILocation(line: 380, column: 208, scope: !630)
!649 = !DILocation(line: 380, column: 242, scope: !630)
!650 = !DILocation(line: 380, column: 239, scope: !630)
!651 = !DILocation(line: 380, column: 17, scope: !631)
!652 = !DILocation(line: 386, column: 25, scope: !653)
!653 = distinct !DILexicalBlock(scope: !631, file: !3, line: 386, column: 17)
!654 = !DILocation(line: 386, column: 17, scope: !653)
!655 = !DILocation(line: 386, column: 35, scope: !653)
!656 = !DILocation(line: 386, column: 40, scope: !653)
!657 = !DILocation(line: 386, column: 44, scope: !653)
!658 = !DILocation(line: 386, column: 75, scope: !653)
!659 = !DILocation(line: 386, column: 96, scope: !653)
!660 = !DILocation(line: 386, column: 99, scope: !653)
!661 = !DILocation(line: 386, column: 133, scope: !653)
!662 = !DILocation(line: 386, column: 130, scope: !653)
!663 = !DILocation(line: 386, column: 151, scope: !653)
!664 = !DILocation(line: 386, column: 154, scope: !653)
!665 = !DILocation(line: 386, column: 188, scope: !653)
!666 = !DILocation(line: 386, column: 185, scope: !653)
!667 = !DILocation(line: 386, column: 206, scope: !653)
!668 = !DILocation(line: 386, column: 209, scope: !653)
!669 = !DILocation(line: 386, column: 243, scope: !653)
!670 = !DILocation(line: 386, column: 240, scope: !653)
!671 = !DILocation(line: 386, column: 17, scope: !631)
!672 = !DILocation(line: 392, column: 25, scope: !673)
!673 = distinct !DILexicalBlock(scope: !631, file: !3, line: 392, column: 17)
!674 = !{!675, !405, i64 8}
!675 = !{!"filter", !405, i64 0, !405, i64 4, !406, i64 5, !405, i64 6, !405, i64 8, !405, i64 12, !406, i64 16, !406, i64 32, !405, i64 48, !406, i64 49, !405, i64 50, !406, i64 51, !405, i64 52, !434, i64 54, !405, i64 56, !434, i64 58, !405, i64 60, !406, i64 61, !676, i64 64, !677, i64 76, !678, i64 84}
!676 = !{!"tcpopts", !405, i64 0, !405, i64 0, !434, i64 2, !405, i64 4, !434, i64 6, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 8, !405, i64 9, !405, i64 9, !405, i64 9, !405, i64 9, !405, i64 9, !405, i64 9, !405, i64 9, !405, i64 9}
!677 = !{!"udpopts", !405, i64 0, !405, i64 0, !434, i64 2, !405, i64 4, !434, i64 6}
!678 = !{!"icmpopts", !405, i64 0, !405, i64 0, !406, i64 1, !405, i64 2, !406, i64 3}
!679 = !DILocation(line: 392, column: 31, scope: !673)
!680 = !DILocation(line: 392, column: 36, scope: !673)
!681 = !DILocation(line: 392, column: 47, scope: !673)
!682 = !{!675, !405, i64 12}
!683 = !DILocation(line: 392, column: 53, scope: !673)
!684 = !DILocation(line: 392, column: 17, scope: !631)
!685 = !DILocation(line: 399, column: 25, scope: !686)
!686 = distinct !DILexicalBlock(scope: !631, file: !3, line: 399, column: 17)
!687 = !DILocation(line: 399, column: 17, scope: !686)
!688 = !DILocation(line: 399, column: 36, scope: !686)
!689 = !DILocation(line: 399, column: 47, scope: !686)
!690 = !{!675, !406, i64 51}
!691 = !DILocation(line: 399, column: 63, scope: !686)
!692 = !{!457, !406, i64 7}
!693 = !DILocation(line: 399, column: 55, scope: !686)
!694 = !DILocation(line: 399, column: 17, scope: !631)
!695 = !DILocation(line: 405, column: 25, scope: !696)
!696 = distinct !DILexicalBlock(scope: !631, file: !3, line: 405, column: 17)
!697 = !DILocation(line: 405, column: 17, scope: !696)
!698 = !DILocation(line: 405, column: 36, scope: !696)
!699 = !DILocation(line: 405, column: 47, scope: !696)
!700 = !{!675, !406, i64 49}
!701 = !DILocation(line: 405, column: 63, scope: !696)
!702 = !DILocation(line: 405, column: 55, scope: !696)
!703 = !DILocation(line: 405, column: 17, scope: !631)
!704 = !DILocation(line: 411, column: 25, scope: !705)
!705 = distinct !DILexicalBlock(scope: !631, file: !3, line: 411, column: 17)
!706 = !DILocation(line: 411, column: 17, scope: !705)
!707 = !DILocation(line: 411, column: 36, scope: !705)
!708 = !DILocation(line: 411, column: 47, scope: !705)
!709 = !{!675, !434, i64 58}
!710 = !DILocation(line: 411, column: 39, scope: !705)
!711 = !DILocation(line: 411, column: 58, scope: !705)
!712 = !{!457, !434, i64 4}
!713 = !DILocation(line: 411, column: 83, scope: !705)
!714 = !DILocation(line: 411, column: 55, scope: !705)
!715 = !DILocation(line: 411, column: 17, scope: !631)
!716 = !DILocation(line: 417, column: 25, scope: !717)
!717 = distinct !DILexicalBlock(scope: !631, file: !3, line: 417, column: 17)
!718 = !DILocation(line: 417, column: 17, scope: !717)
!719 = !DILocation(line: 417, column: 36, scope: !717)
!720 = !DILocation(line: 417, column: 47, scope: !717)
!721 = !{!675, !434, i64 54}
!722 = !DILocation(line: 417, column: 39, scope: !717)
!723 = !DILocation(line: 417, column: 58, scope: !717)
!724 = !DILocation(line: 417, column: 83, scope: !717)
!725 = !DILocation(line: 417, column: 55, scope: !717)
!726 = !DILocation(line: 417, column: 17, scope: !631)
!727 = !DILocation(line: 422, column: 18, scope: !632)
!728 = !DILocation(line: 427, column: 25, scope: !729)
!729 = distinct !DILexicalBlock(scope: !730, file: !3, line: 427, column: 17)
!730 = distinct !DILexicalBlock(scope: !731, file: !3, line: 423, column: 9)
!731 = distinct !DILexicalBlock(scope: !632, file: !3, line: 422, column: 18)
!732 = !DILocation(line: 427, column: 30, scope: !729)
!733 = !DILocation(line: 427, column: 34, scope: !729)
!734 = !DILocation(line: 427, column: 42, scope: !729)
!735 = !DILocation(line: 427, column: 48, scope: !729)
!736 = !DILocation(line: 427, column: 17, scope: !730)
!737 = !DILocation(line: 434, column: 25, scope: !738)
!738 = distinct !DILexicalBlock(scope: !730, file: !3, line: 434, column: 17)
!739 = !DILocation(line: 434, column: 31, scope: !738)
!740 = !DILocation(line: 434, column: 36, scope: !738)
!741 = !DILocation(line: 434, column: 44, scope: !738)
!742 = !DILocation(line: 434, column: 50, scope: !738)
!743 = !DILocation(line: 434, column: 17, scope: !730)
!744 = !DILocation(line: 441, column: 26, scope: !745)
!745 = distinct !DILexicalBlock(scope: !730, file: !3, line: 441, column: 17)
!746 = !DILocation(line: 441, column: 18, scope: !745)
!747 = !DILocation(line: 441, column: 36, scope: !745)
!748 = !DILocation(line: 441, column: 41, scope: !745)
!749 = !DILocation(line: 441, column: 44, scope: !745)
!750 = !DILocation(line: 441, column: 62, scope: !745)
!751 = !DILocation(line: 441, column: 67, scope: !745)
!752 = !DILocation(line: 441, column: 70, scope: !745)
!753 = !DILocation(line: 441, column: 88, scope: !745)
!754 = !DILocation(line: 441, column: 93, scope: !745)
!755 = !DILocation(line: 441, column: 96, scope: !745)
!756 = !DILocation(line: 441, column: 114, scope: !745)
!757 = !DILocation(line: 441, column: 120, scope: !745)
!758 = !DILocation(line: 441, column: 132, scope: !745)
!759 = !DILocation(line: 441, column: 124, scope: !745)
!760 = !DILocation(line: 441, column: 142, scope: !745)
!761 = !DILocation(line: 441, column: 147, scope: !745)
!762 = !DILocation(line: 441, column: 150, scope: !745)
!763 = !DILocation(line: 441, column: 168, scope: !745)
!764 = !DILocation(line: 441, column: 173, scope: !745)
!765 = !DILocation(line: 441, column: 176, scope: !745)
!766 = !DILocation(line: 441, column: 194, scope: !745)
!767 = !DILocation(line: 441, column: 199, scope: !745)
!768 = !DILocation(line: 441, column: 202, scope: !745)
!769 = !DILocation(line: 441, column: 220, scope: !745)
!770 = !DILocation(line: 441, column: 17, scope: !730)
!771 = !DILocation(line: 449, column: 25, scope: !772)
!772 = distinct !DILexicalBlock(scope: !730, file: !3, line: 449, column: 17)
!773 = !DILocation(line: 449, column: 17, scope: !772)
!774 = !DILocation(line: 449, column: 32, scope: !772)
!775 = !DILocation(line: 449, column: 43, scope: !772)
!776 = !{!675, !406, i64 61}
!777 = !DILocation(line: 449, column: 35, scope: !772)
!778 = !DILocation(line: 449, column: 55, scope: !772)
!779 = !{!559, !406, i64 1}
!780 = !DILocation(line: 449, column: 50, scope: !772)
!781 = !DILocation(line: 449, column: 47, scope: !772)
!782 = !DILocation(line: 449, column: 17, scope: !730)
!783 = !DILocation(line: 456, column: 25, scope: !784)
!784 = distinct !DILexicalBlock(scope: !730, file: !3, line: 456, column: 17)
!785 = !DILocation(line: 456, column: 17, scope: !784)
!786 = !DILocation(line: 456, column: 36, scope: !784)
!787 = !DILocation(line: 456, column: 47, scope: !784)
!788 = !DILocation(line: 456, column: 62, scope: !784)
!789 = !{!559, !406, i64 8}
!790 = !DILocation(line: 456, column: 55, scope: !784)
!791 = !DILocation(line: 456, column: 17, scope: !730)
!792 = !DILocation(line: 463, column: 25, scope: !793)
!793 = distinct !DILexicalBlock(scope: !730, file: !3, line: 463, column: 17)
!794 = !DILocation(line: 463, column: 17, scope: !793)
!795 = !DILocation(line: 463, column: 36, scope: !793)
!796 = !DILocation(line: 463, column: 47, scope: !793)
!797 = !DILocation(line: 463, column: 62, scope: !793)
!798 = !DILocation(line: 463, column: 55, scope: !793)
!799 = !DILocation(line: 463, column: 17, scope: !730)
!800 = !DILocation(line: 470, column: 25, scope: !801)
!801 = distinct !DILexicalBlock(scope: !730, file: !3, line: 470, column: 17)
!802 = !DILocation(line: 470, column: 17, scope: !801)
!803 = !DILocation(line: 470, column: 36, scope: !801)
!804 = !DILocation(line: 470, column: 47, scope: !801)
!805 = !DILocation(line: 470, column: 39, scope: !801)
!806 = !DILocation(line: 470, column: 58, scope: !801)
!807 = !{!559, !434, i64 2}
!808 = !DILocation(line: 470, column: 78, scope: !801)
!809 = !DILocation(line: 470, column: 55, scope: !801)
!810 = !DILocation(line: 470, column: 17, scope: !730)
!811 = !DILocation(line: 477, column: 25, scope: !812)
!812 = distinct !DILexicalBlock(scope: !730, file: !3, line: 477, column: 17)
!813 = !DILocation(line: 477, column: 17, scope: !812)
!814 = !DILocation(line: 477, column: 36, scope: !812)
!815 = !DILocation(line: 477, column: 47, scope: !812)
!816 = !DILocation(line: 477, column: 39, scope: !812)
!817 = !DILocation(line: 477, column: 58, scope: !812)
!818 = !DILocation(line: 477, column: 78, scope: !812)
!819 = !DILocation(line: 477, column: 55, scope: !812)
!820 = !DILocation(line: 477, column: 17, scope: !730)
!821 = !DILocation(line: 485, column: 15, scope: !822)
!822 = distinct !DILexicalBlock(scope: !269, file: !3, line: 485, column: 7)
!823 = !DILocation(line: 485, column: 23, scope: !822)
!824 = !DILocation(line: 485, column: 7, scope: !822)
!825 = !DILocation(line: 485, column: 7, scope: !269)
!826 = !DILocation(line: 487, column: 17, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !3, line: 486, column: 9)
!828 = !DILocation(line: 493, column: 17, scope: !829)
!829 = distinct !DILexicalBlock(scope: !827, file: !3, line: 493, column: 17)
!830 = !DILocation(line: 493, column: 42, scope: !829)
!831 = !DILocation(line: 493, column: 45, scope: !829)
!832 = !{!675, !434, i64 66}
!833 = !DILocation(line: 493, column: 83, scope: !829)
!834 = !{!835, !434, i64 0}
!835 = !{!"tcphdr", !434, i64 0, !434, i64 2, !405, i64 4, !405, i64 8, !434, i64 12, !434, i64 12, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 13, !434, i64 14, !434, i64 16, !434, i64 18}
!836 = !DILocation(line: 493, column: 74, scope: !829)
!837 = !DILocation(line: 493, column: 17, scope: !827)
!838 = !DILocation(line: 499, column: 33, scope: !839)
!839 = distinct !DILexicalBlock(scope: !827, file: !3, line: 499, column: 17)
!840 = !DILocation(line: 499, column: 17, scope: !839)
!841 = !DILocation(line: 499, column: 42, scope: !839)
!842 = !DILocation(line: 499, column: 45, scope: !839)
!843 = !{!675, !434, i64 70}
!844 = !DILocation(line: 499, column: 83, scope: !839)
!845 = !{!835, !434, i64 2}
!846 = !DILocation(line: 499, column: 74, scope: !839)
!847 = !DILocation(line: 499, column: 17, scope: !827)
!848 = !DILocation(line: 505, column: 33, scope: !849)
!849 = distinct !DILexicalBlock(scope: !827, file: !3, line: 505, column: 17)
!850 = !DILocation(line: 505, column: 17, scope: !849)
!851 = !DILocation(line: 505, column: 40, scope: !849)
!852 = !DILocation(line: 505, column: 59, scope: !849)
!853 = !DILocation(line: 505, column: 72, scope: !849)
!854 = !DILocation(line: 505, column: 63, scope: !849)
!855 = !DILocation(line: 505, column: 17, scope: !827)
!856 = !DILocation(line: 511, column: 17, scope: !857)
!857 = distinct !DILexicalBlock(scope: !827, file: !3, line: 511, column: 17)
!858 = !DILocation(line: 511, column: 40, scope: !857)
!859 = !DILocation(line: 511, column: 59, scope: !857)
!860 = !DILocation(line: 511, column: 72, scope: !857)
!861 = !DILocation(line: 511, column: 63, scope: !857)
!862 = !DILocation(line: 511, column: 17, scope: !827)
!863 = !DILocation(line: 517, column: 17, scope: !864)
!864 = distinct !DILexicalBlock(scope: !827, file: !3, line: 517, column: 17)
!865 = !DILocation(line: 517, column: 40, scope: !864)
!866 = !DILocation(line: 517, column: 59, scope: !864)
!867 = !DILocation(line: 517, column: 72, scope: !864)
!868 = !DILocation(line: 517, column: 63, scope: !864)
!869 = !DILocation(line: 517, column: 17, scope: !827)
!870 = !DILocation(line: 523, column: 17, scope: !871)
!871 = distinct !DILexicalBlock(scope: !827, file: !3, line: 523, column: 17)
!872 = !DILocation(line: 523, column: 40, scope: !871)
!873 = !DILocation(line: 523, column: 59, scope: !871)
!874 = !DILocation(line: 523, column: 72, scope: !871)
!875 = !DILocation(line: 523, column: 63, scope: !871)
!876 = !DILocation(line: 523, column: 17, scope: !827)
!877 = !DILocation(line: 529, column: 17, scope: !878)
!878 = distinct !DILexicalBlock(scope: !827, file: !3, line: 529, column: 17)
!879 = !DILocation(line: 529, column: 40, scope: !878)
!880 = !DILocation(line: 529, column: 72, scope: !878)
!881 = !DILocation(line: 529, column: 63, scope: !878)
!882 = !DILocation(line: 529, column: 17, scope: !827)
!883 = !DILocation(line: 535, column: 17, scope: !884)
!884 = distinct !DILexicalBlock(scope: !827, file: !3, line: 535, column: 17)
!885 = !DILocation(line: 535, column: 40, scope: !884)
!886 = !DILocation(line: 535, column: 59, scope: !884)
!887 = !DILocation(line: 535, column: 72, scope: !884)
!888 = !DILocation(line: 535, column: 63, scope: !884)
!889 = !DILocation(line: 535, column: 17, scope: !827)
!890 = !DILocation(line: 541, column: 17, scope: !891)
!891 = distinct !DILexicalBlock(scope: !827, file: !3, line: 541, column: 17)
!892 = !DILocation(line: 541, column: 40, scope: !891)
!893 = !DILocation(line: 541, column: 59, scope: !891)
!894 = !DILocation(line: 541, column: 72, scope: !891)
!895 = !DILocation(line: 541, column: 63, scope: !891)
!896 = !DILocation(line: 541, column: 17, scope: !827)
!897 = !DILocation(line: 547, column: 17, scope: !898)
!898 = distinct !DILexicalBlock(scope: !827, file: !3, line: 547, column: 17)
!899 = !DILocation(line: 547, column: 40, scope: !898)
!900 = !DILocation(line: 547, column: 72, scope: !898)
!901 = !DILocation(line: 547, column: 63, scope: !898)
!902 = !DILocation(line: 547, column: 17, scope: !827)
!903 = !DILocation(line: 552, column: 26, scope: !904)
!904 = distinct !DILexicalBlock(scope: !822, file: !3, line: 552, column: 18)
!905 = !DILocation(line: 552, column: 34, scope: !904)
!906 = !DILocation(line: 552, column: 18, scope: !904)
!907 = !DILocation(line: 552, column: 18, scope: !822)
!908 = !DILocation(line: 554, column: 17, scope: !909)
!909 = distinct !DILexicalBlock(scope: !904, file: !3, line: 553, column: 9)
!910 = !DILocation(line: 560, column: 17, scope: !911)
!911 = distinct !DILexicalBlock(scope: !909, file: !3, line: 560, column: 17)
!912 = !DILocation(line: 560, column: 42, scope: !911)
!913 = !DILocation(line: 560, column: 45, scope: !911)
!914 = !{!675, !434, i64 78}
!915 = !DILocation(line: 560, column: 83, scope: !911)
!916 = !{!917, !434, i64 0}
!917 = !{!"udphdr", !434, i64 0, !434, i64 2, !434, i64 4, !434, i64 6}
!918 = !DILocation(line: 560, column: 74, scope: !911)
!919 = !DILocation(line: 560, column: 17, scope: !909)
!920 = !DILocation(line: 566, column: 33, scope: !921)
!921 = distinct !DILexicalBlock(scope: !909, file: !3, line: 566, column: 17)
!922 = !DILocation(line: 566, column: 17, scope: !921)
!923 = !DILocation(line: 566, column: 42, scope: !921)
!924 = !DILocation(line: 566, column: 45, scope: !921)
!925 = !{!675, !434, i64 82}
!926 = !DILocation(line: 566, column: 83, scope: !921)
!927 = !{!917, !434, i64 2}
!928 = !DILocation(line: 566, column: 74, scope: !921)
!929 = !DILocation(line: 566, column: 17, scope: !909)
!930 = !DILocation(line: 571, column: 27, scope: !931)
!931 = distinct !DILexicalBlock(scope: !904, file: !3, line: 571, column: 19)
!932 = !DILocation(line: 571, column: 36, scope: !931)
!933 = !DILocation(line: 571, column: 19, scope: !931)
!934 = !DILocation(line: 571, column: 19, scope: !904)
!935 = !DILocation(line: 576, column: 17, scope: !936)
!936 = distinct !DILexicalBlock(scope: !931, file: !3, line: 571, column: 44)
!937 = !DILocation(line: 580, column: 21, scope: !938)
!938 = distinct !DILexicalBlock(scope: !939, file: !3, line: 580, column: 21)
!939 = distinct !DILexicalBlock(scope: !940, file: !3, line: 577, column: 13)
!940 = distinct !DILexicalBlock(scope: !936, file: !3, line: 576, column: 17)
!941 = !DILocation(line: 580, column: 46, scope: !938)
!942 = !DILocation(line: 580, column: 66, scope: !938)
!943 = !{!675, !406, i64 85}
!944 = !DILocation(line: 580, column: 81, scope: !938)
!945 = !{!946, !406, i64 1}
!946 = !{!"icmphdr", !406, i64 0, !406, i64 1, !434, i64 2, !406, i64 4}
!947 = !DILocation(line: 580, column: 71, scope: !938)
!948 = !DILocation(line: 580, column: 21, scope: !939)
!949 = !DILocation(line: 586, column: 38, scope: !950)
!950 = distinct !DILexicalBlock(scope: !939, file: !3, line: 586, column: 21)
!951 = !DILocation(line: 586, column: 21, scope: !950)
!952 = !DILocation(line: 586, column: 46, scope: !950)
!953 = !DILocation(line: 586, column: 66, scope: !950)
!954 = !{!675, !406, i64 87}
!955 = !DILocation(line: 586, column: 81, scope: !950)
!956 = !{!946, !406, i64 0}
!957 = !DILocation(line: 586, column: 71, scope: !950)
!958 = !DILocation(line: 586, column: 21, scope: !939)
!959 = !DILocation(line: 591, column: 22, scope: !940)
!960 = !DILocation(line: 594, column: 21, scope: !961)
!961 = distinct !DILexicalBlock(scope: !962, file: !3, line: 594, column: 21)
!962 = distinct !DILexicalBlock(scope: !963, file: !3, line: 592, column: 13)
!963 = distinct !DILexicalBlock(scope: !940, file: !3, line: 591, column: 22)
!964 = !DILocation(line: 594, column: 46, scope: !961)
!965 = !DILocation(line: 594, column: 66, scope: !961)
!966 = !DILocation(line: 594, column: 82, scope: !961)
!967 = !{!968, !406, i64 1}
!968 = !{!"icmp6hdr", !406, i64 0, !406, i64 1, !434, i64 2, !406, i64 4}
!969 = !DILocation(line: 594, column: 71, scope: !961)
!970 = !DILocation(line: 594, column: 21, scope: !962)
!971 = !DILocation(line: 600, column: 38, scope: !972)
!972 = distinct !DILexicalBlock(scope: !962, file: !3, line: 600, column: 21)
!973 = !DILocation(line: 600, column: 21, scope: !972)
!974 = !DILocation(line: 600, column: 46, scope: !972)
!975 = !DILocation(line: 600, column: 66, scope: !972)
!976 = !DILocation(line: 600, column: 82, scope: !972)
!977 = !{!968, !406, i64 0}
!978 = !DILocation(line: 600, column: 71, scope: !972)
!979 = !DILocation(line: 600, column: 21, scope: !962)
!980 = !DILocation(line: 612, column: 9, scope: !981)
!981 = distinct !DILexicalBlock(scope: !269, file: !3, line: 612, column: 9)
!982 = !{!675, !405, i64 0}
!983 = !DILocation(line: 613, column: 26, scope: !269)
!984 = !{!675, !406, i64 5}
!985 = !DILocation(line: 613, column: 18, scope: !269)
!986 = !DILocation(line: 616, column: 2, scope: !270)
!987 = !DILocation(line: 353, column: 37, scope: !270)
!988 = !DILocation(line: 353, column: 21, scope: !270)
!989 = distinct !{!989, !614, !990, !991}
!990 = !DILocation(line: 616, column: 2, scope: !267)
!991 = !{!"llvm.loop.mustprogress"}
!992 = !DILocation(line: 620, column: 13, scope: !993)
!993 = distinct !DILexicalBlock(scope: !56, file: !3, line: 620, column: 8)
!994 = !DILocation(line: 620, column: 8, scope: !56)
!995 = !DILocation(line: 0, scope: !996, inlinedAt: !1006)
!996 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !3, file: !3, line: 194, type: !997, scopeLine: 195, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !999)
!997 = !DISubroutineType(types: !998)
!998 = !{!64, !60, !64}
!999 = !{!1000, !1001, !1002, !1003, !1004, !1005}
!1000 = !DILocalVariable(name: "ctx", arg: 1, scope: !996, file: !3, line: 194, type: !60)
!1001 = !DILocalVariable(name: "action", arg: 2, scope: !996, file: !3, line: 194, type: !64)
!1002 = !DILocalVariable(name: "data_end", scope: !996, file: !3, line: 196, type: !46)
!1003 = !DILocalVariable(name: "data", scope: !996, file: !3, line: 197, type: !46)
!1004 = !DILocalVariable(name: "rec", scope: !996, file: !3, line: 203, type: !358)
!1005 = !DILocalVariable(name: "bytes", scope: !996, file: !3, line: 208, type: !362)
!1006 = distinct !DILocation(line: 626, column: 16, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !993, file: !3, line: 620, column: 18)
!1008 = !DILocation(line: 196, column: 38, scope: !996, inlinedAt: !1006)
!1009 = !DILocation(line: 196, column: 27, scope: !996, inlinedAt: !1006)
!1010 = !DILocation(line: 197, column: 38, scope: !996, inlinedAt: !1006)
!1011 = !DILocation(line: 197, column: 27, scope: !996, inlinedAt: !1006)
!1012 = !DILocation(line: 199, column: 13, scope: !1013, inlinedAt: !1006)
!1013 = distinct !DILexicalBlock(scope: !996, file: !3, line: 199, column: 6)
!1014 = !DILocation(line: 199, column: 6, scope: !996, inlinedAt: !1006)
!1015 = !DILocation(line: 203, column: 24, scope: !996, inlinedAt: !1006)
!1016 = !DILocation(line: 204, column: 7, scope: !1017, inlinedAt: !1006)
!1017 = distinct !DILexicalBlock(scope: !996, file: !3, line: 204, column: 6)
!1018 = !DILocation(line: 204, column: 6, scope: !996, inlinedAt: !1006)
!1019 = !DILocation(line: 208, column: 25, scope: !996, inlinedAt: !1006)
!1020 = !DILocation(line: 214, column: 7, scope: !996, inlinedAt: !1006)
!1021 = !DILocation(line: 214, column: 17, scope: !996, inlinedAt: !1006)
!1022 = !{!1023, !1024, i64 0}
!1023 = !{!"datarec", !1024, i64 0, !1024, i64 8}
!1024 = !{!"long long", !406, i64 0}
!1025 = !DILocation(line: 215, column: 7, scope: !996, inlinedAt: !1006)
!1026 = !DILocation(line: 215, column: 16, scope: !996, inlinedAt: !1006)
!1027 = !{!1023, !1024, i64 8}
!1028 = !DILocation(line: 217, column: 9, scope: !996, inlinedAt: !1006)
!1029 = !DILocation(line: 218, column: 1, scope: !996, inlinedAt: !1006)
!1030 = !DILocation(line: 626, column: 9, scope: !1007)
!1031 = !DILocation(line: 0, scope: !996, inlinedAt: !1032)
!1032 = distinct !DILocation(line: 630, column: 12, scope: !56)
!1033 = !DILocation(line: 196, column: 38, scope: !996, inlinedAt: !1032)
!1034 = !DILocation(line: 197, column: 38, scope: !996, inlinedAt: !1032)
!1035 = !DILocation(line: 203, column: 24, scope: !996, inlinedAt: !1032)
!1036 = !DILocation(line: 204, column: 7, scope: !1017, inlinedAt: !1032)
!1037 = !DILocation(line: 204, column: 6, scope: !996, inlinedAt: !1032)
!1038 = !DILocation(line: 197, column: 27, scope: !996, inlinedAt: !1032)
!1039 = !DILocation(line: 196, column: 27, scope: !996, inlinedAt: !1032)
!1040 = !DILocation(line: 208, column: 25, scope: !996, inlinedAt: !1032)
!1041 = !DILocation(line: 214, column: 7, scope: !996, inlinedAt: !1032)
!1042 = !DILocation(line: 214, column: 17, scope: !996, inlinedAt: !1032)
!1043 = !DILocation(line: 215, column: 7, scope: !996, inlinedAt: !1032)
!1044 = !DILocation(line: 215, column: 16, scope: !996, inlinedAt: !1032)
!1045 = !DILocation(line: 217, column: 9, scope: !996, inlinedAt: !1032)
!1046 = !DILocation(line: 218, column: 1, scope: !996, inlinedAt: !1032)
!1047 = !DILocation(line: 630, column: 5, scope: !56)
!1048 = !DILocation(line: 632, column: 1, scope: !56)
