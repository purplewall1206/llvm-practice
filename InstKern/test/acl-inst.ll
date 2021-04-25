; ModuleID = 'acl-inst.bc'
source_filename = "fs/ext4/acl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.user_namespace = type opaque
%struct.posix_acl = type { %struct.refcount_struct, %struct.callback_head, i32, [0 x %struct.posix_acl_entry] }
%struct.refcount_struct = type { %struct.atomic_t }
%struct.atomic_t = type { i32 }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.posix_acl_entry = type { i16, i16, %union.anon }
%union.anon = type { %struct.kuid_t }
%struct.kuid_t = type { i32 }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.78, i32, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.spinlock, i16, i8, i8, i64, i64, %struct.rw_semaphore, i64, i64, %struct.hlist_node, %struct.list_head, %struct.bdi_writeback*, i32, i16, i16, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.79, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %union.anon.80, %struct.file_lock_context*, %struct.address_space, %struct.list_head, %union.anon.81, i32, i32, %struct.fsnotify_mark_connector*, %struct.fscrypt_info*, %struct.fsverity_info*, i8* }
%struct.kgid_t = type { i32 }
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.inode*, %struct.delayed_call*)*, i32 (%struct.inode*, i32)*, {}*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.path*, %struct.kstat*, i32, i32)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec64*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, [24 x i8] }
%struct.dentry = type { i32, %struct.seqcount_spinlock, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %union.anon.76, %struct.list_head, %struct.list_head, %union.anon.77 }
%struct.seqcount_spinlock = type { %struct.seqcount }
%struct.seqcount = type { i32 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.0, i8* }
%union.anon.0 = type { i64 }
%struct.lockref = type { %union.anon.1 }
%union.anon.1 = type { i64 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.path*, i1)*, %struct.dentry* (%struct.dentry*, %struct.inode*)*, [24 x i8] }
%struct.vfsmount = type opaque
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%union.anon.76 = type { %struct.list_head }
%union.anon.77 = type { %struct.hlist_node }
%struct.delayed_call = type { void (i8*)*, i8* }
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.file* }
%struct.file = type { %union.anon.10, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, i32, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space*, i32, i32 }
%union.anon.10 = type { %struct.callback_head }
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, i1)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, i64, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i64 (%struct.file*, i64, %struct.file*, i64, i64, i32)*, i32 (%struct.file*, i64, i64, i32)* }
%struct.module = type opaque
%struct.kiocb = type { %struct.file*, i64, void (%struct.kiocb*, i64, i64)*, i8*, i32, i16, i16, %union.anon.11 }
%union.anon.11 = type { %struct.wait_page_queue* }
%struct.wait_page_queue = type { %struct.page*, i32, %struct.wait_queue_entry }
%struct.page = type { i64, %union.anon.8, %union.anon.74, %struct.atomic_t, %union.anon.75 }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { %struct.list_head, %struct.address_space*, i64, i64 }
%union.anon.74 = type { %struct.atomic_t }
%union.anon.75 = type { %struct.mem_cgroup* }
%struct.mem_cgroup = type opaque
%struct.wait_queue_entry = type { i32, i8*, i32 (%struct.wait_queue_entry*, i32, i32, i8*)*, %struct.list_head }
%struct.iov_iter = type { i32, i64, i64, %union.anon.12, %union.anon.13 }
%union.anon.12 = type { %struct.iovec* }
%struct.iovec = type { i8*, i64 }
%union.anon.13 = type { i64 }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.poll_table_struct = type opaque
%struct.vm_area_struct = type { i64, i64, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i64, %struct.mm_struct*, %struct.pgprot, i64, %struct.anon.57, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i64, %struct.file*, i8*, %struct.atomic64_t, %struct.mempolicy*, %struct.vm_userfaultfd_ctx }
%struct.rb_node = type { i64, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.anon.15, [0 x i64] }
%struct.anon.15 = type { %struct.vm_area_struct*, %struct.rb_root, i64, i64 (%struct.file*, i64, i64, i64, i64)*, i64, i64, i64, i64, i64, i64, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.seqcount, %struct.atomic64_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i64, i64, i64, i64, %struct.atomic64_t, i64, i64, i64, i64, %struct.spinlock, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [46 x i64], %struct.mm_rss_stat, %struct.linux_binfmt*, %struct.mm_context_t, i64, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.task_struct*, %struct.user_namespace*, %struct.file*, %struct.mmu_notifier_subscriptions*, i64, i64, i32, %struct.atomic_t, i8, %struct.uprobes_state, %struct.atomic64_t, %struct.work_struct, i32 }
%struct.rb_root = type { %struct.rb_node* }
%struct.pgd_t = type { i64 }
%struct.mm_rss_stat = type { [4 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i64, %struct.atomic64_t, %struct.rw_semaphore, %struct.ldt_struct*, i16, %struct.mutex, i8*, %struct.vdso_image*, %struct.atomic_t, i16, i16 }
%struct.ldt_struct = type opaque
%struct.vdso_image = type opaque
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.swait_queue_head }
%struct.swait_queue_head = type { %struct.raw_spinlock, %struct.list_head }
%struct.raw_spinlock = type { %struct.qspinlock }
%struct.qspinlock = type { %union.anon.4 }
%union.anon.4 = type { %struct.atomic_t }
%struct.kioctx_table = type opaque
%struct.task_struct = type { %struct.thread_info, i64, i8*, %struct.refcount_struct, i32, i32, i32, %struct.__call_single_node, i32, i32, i64, %struct.task_struct*, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, [2 x %struct.uclamp_se], [2 x %struct.uclamp_se], %struct.hlist_head, i32, i32, i32, %struct.cpumask*, %struct.cpumask, i32, %union.rcu_special, %struct.list_head, %struct.rcu_node*, i64, i8, i8, i32, %struct.list_head, i32, i32, %union.rcu_special, i8, %struct.list_head, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, %struct.vmacache, %struct.task_rss_stat, i32, i32, i32, i32, i64, i32, i8, [3 x i8], i16, i64, %struct.restart_block, i32, i32, i64, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.pid*, [4 x %struct.hlist_node], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, %struct.posix_cputimers, %struct.posix_cputimers_work, %struct.cred*, %struct.cred*, %struct.cred*, %struct.key*, [16 x i8], %struct.nameidata*, %struct.sysv_sem, %struct.sysv_shm, i64, i64, %struct.fs_struct*, %struct.files_struct*, %struct.io_uring_task*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i64, i64, i32, %struct.callback_head*, %struct.audit_context*, %struct.kuid_t, i32, %struct.seccomp, i64, i64, %struct.spinlock, %struct.raw_spinlock, %struct.wake_q_node, %struct.rb_root_cached, %struct.task_struct*, %struct.rt_mutex_waiter*, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, %struct.capture_control*, i64, %struct.kernel_siginfo*, %struct.task_io_accounting, i32, i64, i64, i64, %struct.nodemask_t, %struct.seqcount_spinlock, i32, i32, %struct.css_set*, %struct.list_head, i32, i32, %struct.robust_list_head*, %struct.compat_robust_list_head*, %struct.list_head, %struct.futex_pi_state*, %struct.mutex, i32, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, i64, %struct.mempolicy*, i16, i16, i32, i32, i32, i32, i64, i64, i64, i64, %struct.callback_head, %struct.numa_group*, i64*, i64, [3 x i64], i64, %struct.rseq*, i32, i64, %struct.tlbflush_unmap_batch, %union.anon.49, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i64, i32, [32 x %struct.latency_record], i64, i64, i32, i32, %struct.ftrace_ret_stack*, i64, %struct.atomic_t, %struct.atomic_t, i64, i64, %struct.mem_cgroup*, i32, i32, i32, %struct.mem_cgroup*, %struct.request_queue*, %struct.uprobe_task*, i32, i32, i32, %struct.task_struct*, %struct.vm_struct*, %struct.refcount_struct, i8*, i8*, i64, i64, i64, %struct.callback_head, [8 x i8], %struct.thread_struct }
%struct.thread_info = type { i64, i32 }
%struct.__call_single_node = type { %struct.llist_node, %union.anon.16, i16, i16 }
%struct.llist_node = type { %struct.llist_node* }
%union.anon.16 = type { i32 }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, i64, [24 x i8], %struct.sched_avg }
%struct.load_weight = type { i64, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i64, i64, i64, i32, i32, i64, i64, i64, %struct.util_est }
%struct.util_est = type { i32, i32 }
%struct.sched_rt_entity = type { %struct.list_head, i64, i64, i32, i16, i16, %struct.sched_rt_entity* }
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i64, i32, i8, %struct.hrtimer, %struct.hrtimer, %struct.sched_dl_entity* }
%struct.hrtimer = type { %struct.timerqueue_node, i64, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i8, i8, i8, i8 }
%struct.timerqueue_node = type { %struct.rb_node, i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.seqcount_raw_spinlock, %struct.hrtimer*, %struct.timerqueue_head, i64 ()*, i64 }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, i8, i32, i16, i16, i32, i64, %struct.hrtimer*, i64, %struct.hrtimer*, [8 x %struct.hrtimer_clock_base] }
%struct.seqcount_raw_spinlock = type { %struct.seqcount }
%struct.timerqueue_head = type { %struct.rb_root_cached }
%struct.uclamp_se = type { i16, [2 x i8] }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.cpumask = type { [5 x i64] }
%struct.rcu_node = type opaque
%union.rcu_special = type { i32 }
%struct.sched_info = type { i64, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.vmacache = type { i64, [4 x %struct.vm_area_struct*] }
%struct.task_rss_stat = type { i32, [4 x i32] }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.18 }
%union.anon.18 = type { %struct.anon.19 }
%struct.anon.19 = type { i32*, i32, i32, i32, i64, i32* }
%struct.pid = type { %struct.refcount_struct, i32, %struct.spinlock, [4 x %struct.hlist_head], %struct.hlist_head, %struct.wait_queue_head, %struct.callback_head, [1 x %struct.upid] }
%struct.wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.upid = type { i32, %struct.pid_namespace* }
%struct.pid_namespace = type opaque
%struct.prev_cputime = type { i64, i64, %struct.raw_spinlock }
%struct.posix_cputimers = type { [3 x %struct.posix_cputimer_base], i32, i32 }
%struct.posix_cputimer_base = type { i64, %struct.timerqueue_head }
%struct.posix_cputimers_work = type { %struct.callback_head, i32 }
%struct.key = type { %struct.refcount_struct, i32, %union.anon.23, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.24, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i16, i64, %union.anon.25, %union.anon.29, %struct.key_restriction* }
%union.anon.23 = type { %struct.rb_node }
%struct.key_user = type opaque
%union.anon.24 = type { i64 }
%union.anon.25 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { i64, %union.anon.26, %struct.key_type*, %struct.key_tag*, i8* }
%union.anon.26 = type { i64 }
%struct.key_type = type opaque
%struct.key_tag = type { %struct.callback_head, %struct.refcount_struct, i8 }
%union.anon.29 = type { %union.key_payload }
%union.key_payload = type { [4 x i8*] }
%struct.key_restriction = type { i32 (%struct.key*, %struct.key_type*, %union.key_payload*, %struct.key*)*, %struct.key*, %struct.key_type* }
%struct.nameidata = type opaque
%struct.sysv_sem = type { %struct.sem_undo_list* }
%struct.sem_undo_list = type opaque
%struct.sysv_shm = type { %struct.list_head }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.io_uring_task = type opaque
%struct.nsproxy = type opaque
%struct.signal_struct = type { %struct.refcount_struct, %struct.atomic_t, i32, %struct.list_head, %struct.wait_queue_head, %struct.task_struct*, %struct.sigpending, %struct.hlist_head, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, i64, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.posix_cputimers, [4 x %struct.pid*], %struct.pid*, i32, %struct.tty_struct*, %struct.autogroup*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.prev_cputime, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, %struct.tty_audit_buf*, i8, i16, i16, %struct.mm_struct*, %struct.mutex, %struct.rw_semaphore }
%struct.cpu_itimer = type { i64, i64 }
%struct.thread_group_cputimer = type { %struct.task_cputime_atomic }
%struct.task_cputime_atomic = type { %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t }
%struct.tty_struct = type opaque
%struct.autogroup = type opaque
%struct.seqlock_t = type { %struct.seqcount_spinlock, %struct.spinlock }
%struct.rlimit = type { i64, i64 }
%struct.pacct_struct = type { i32, i64, i64, i64, i64, i64, i64 }
%struct.taskstats = type opaque
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.spinlock, %struct.refcount_struct, %struct.wait_queue_head, [64 x %struct.k_sigaction] }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i64, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [1 x i64] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.seccomp = type { i32, %struct.atomic_t, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.wake_q_node = type { %struct.wake_q_node* }
%struct.rb_root_cached = type { %struct.rb_root, %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.bio_list = type { %struct.bio*, %struct.bio* }
%struct.bio = type { %struct.bio*, %struct.gendisk*, i32, i16, i16, i16, i8, i8, %struct.atomic_t, %struct.bvec_iter, void (%struct.bio*)*, i8*, %struct.blkcg_gq*, %struct.bio_issue, i64, %union.anon.34, i16, i16, %struct.atomic_t, %struct.bio_vec*, %struct.bio_set*, [0 x %struct.bio_vec] }
%struct.gendisk = type { i32, i32, i32, [32 x i8], i16, i16, %struct.disk_part_tbl*, %struct.hd_struct, %struct.block_device_operations*, %struct.request_queue*, i8*, i32, i64, %struct.rw_semaphore, %struct.kobject*, %struct.timer_rand_state*, %struct.atomic_t, %struct.disk_events*, %struct.kobject, %struct.cdrom_device_info*, i32, %struct.badblocks*, %struct.lockdep_map }
%struct.disk_part_tbl = type { %struct.callback_head, i32, %struct.hd_struct*, [0 x %struct.hd_struct*] }
%struct.hd_struct = type { i64, i64, i64, %struct.disk_stats*, %struct.percpu_ref, %struct.device, %struct.kobject*, i32, i32, %struct.partition_meta_info*, %struct.rcu_work }
%struct.disk_stats = type opaque
%struct.percpu_ref = type { i64, %struct.percpu_ref_data* }
%struct.percpu_ref_data = type { %struct.atomic64_t, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head, %struct.percpu_ref* }
%struct.device = type { %struct.kobject, %struct.device*, %struct.device_private*, i8*, %struct.device_type*, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.mutex, %struct.dev_links_info, %struct.dev_pm_info, %struct.dev_pm_domain*, %struct.em_perf_domain*, %struct.irq_domain*, %struct.dev_pin_info*, %struct.list_head, %struct.dma_map_ops*, i64*, i64, i64, %struct.bus_dma_region*, %struct.device_dma_parameters*, %struct.list_head, %struct.dev_archdata, %struct.device_node*, %struct.fwnode_handle*, i32, i32, i32, %struct.spinlock, %struct.list_head, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, %struct.dev_iommu*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.kobj_uevent_env = type { [3 x i8*], [64 x i8*], i32, [2048 x i8], i32 }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key, i8 }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.lock_class_key = type {}
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, i32, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.attribute_group**, %struct.dev_pm_ops*, void (%struct.device*)*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_links_info = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, i8, i32 }
%struct.dev_pm_info = type { %struct.pm_message, i16, i32, %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.hrtimer, i64, %struct.work_struct, %struct.wait_queue_head, %struct.wake_irq*, %struct.atomic_t, %struct.atomic_t, i16, i32, i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.wakeup_source = type { i8*, i32, %struct.list_head, %struct.spinlock, %struct.wake_irq*, %struct.timer_list, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.device*, i8 }
%struct.timer_list = type { %struct.hlist_node, i64, void (%struct.timer_list*)*, i32 }
%struct.wake_irq = type opaque
%struct.pm_subsys_data = type { %struct.spinlock, i32, %struct.list_head, %struct.pm_domain_data* }
%struct.pm_domain_data = type opaque
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, i32 (%struct.device*)*, void (%struct.device*, i1)*, i32 (%struct.device*)*, void (%struct.device*)*, void (%struct.device*)* }
%struct.em_perf_domain = type { %struct.em_perf_state*, i32, [0 x i64] }
%struct.em_perf_state = type { i64, i64, i64 }
%struct.irq_domain = type opaque
%struct.dev_pin_info = type opaque
%struct.dma_map_ops = type opaque
%struct.bus_dma_region = type opaque
%struct.device_dma_parameters = type { i32, i64 }
%struct.dev_archdata = type {}
%struct.device_node = type opaque
%struct.fwnode_handle = type { %struct.fwnode_handle*, %struct.fwnode_operations*, %struct.device* }
%struct.fwnode_operations = type { %struct.fwnode_handle* (%struct.fwnode_handle*)*, void (%struct.fwnode_handle*)*, i1 (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*, %struct.device*)*, i1 (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i32, i8*, i64)*, i32 (%struct.fwnode_handle*, i8*, i8**, i64)*, i8* (%struct.fwnode_handle*)*, i8* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, i8*)*, i32 (%struct.fwnode_handle*, i8*, i8*, i32, i32, %struct.fwnode_reference_args*)*, %struct.fwnode_handle* (%struct.fwnode_handle*, %struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, %struct.fwnode_handle* (%struct.fwnode_handle*)*, i32 (%struct.fwnode_handle*, %struct.fwnode_endpoint*)*, i32 (%struct.fwnode_handle*, %struct.device*)* }
%struct.fwnode_reference_args = type { %struct.fwnode_handle*, i32, [8 x i64] }
%struct.fwnode_endpoint = type { i32, i32, %struct.fwnode_handle* }
%struct.class = type { i8*, %struct.module*, %struct.attribute_group**, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, void (%struct.device*, %struct.kuid_t*, %struct.kgid_t*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type opaque
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, i16 (%struct.kobject*, %struct.bin_attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.attribute = type { i8*, i16 }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.iommu_group = type opaque
%struct.dev_iommu = type opaque
%struct.partition_meta_info = type { [37 x i8], [64 x i8] }
%struct.rcu_work = type { %struct.work_struct, %struct.callback_head, %struct.workqueue_struct* }
%struct.workqueue_struct = type opaque
%struct.block_device_operations = type { i32 (%struct.bio*)*, i32 (%struct.block_device*, i32)*, void (%struct.gendisk*, i32)*, i32 (%struct.block_device*, i64, %struct.page*, i32)*, i32 (%struct.block_device*, i32, i32, i64)*, i32 (%struct.block_device*, i32, i32, i64)*, i32 (%struct.gendisk*, i32)*, void (%struct.gendisk*)*, i32 (%struct.gendisk*)*, i32 (%struct.block_device*, %struct.hd_geometry*)*, void (%struct.block_device*, i64)*, i32 (%struct.gendisk*, i64, i32, i32 (%struct.blk_zone*, i32, i8*)*, i8*)*, i8* (%struct.gendisk*, i16*)*, %struct.module*, %struct.pr_ops* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i8, %struct.hd_struct*, i32, %struct.spinlock, %struct.gendisk*, %struct.backing_dev_info*, i32, %struct.mutex }
%struct.hd_geometry = type opaque
%struct.blk_zone = type { i64, i64, i64, i8, i8, i8, i8, [4 x i8], i64, [24 x i8] }
%struct.pr_ops = type opaque
%struct.timer_rand_state = type opaque
%struct.disk_events = type opaque
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.attribute_group**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)*, void (%struct.kobject*, %struct.kuid_t*, %struct.kgid_t*)* }
%struct.sysfs_ops = type { i64 (%struct.kobject*, %struct.attribute*, i8*)*, i64 (%struct.kobject*, %struct.attribute*, i8*, i64)* }
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.32, i8*, i64, i16, i16, %struct.kernfs_iattrs* }
%union.anon.32 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.kernfs_open_file*)*, void (%struct.kernfs_open_file*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.poll_table_struct*)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, %struct.seq_file*, i8*, %struct.mutex, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.seq_file = type opaque
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.refcount_struct }
%struct.cdrom_device_info = type opaque
%struct.badblocks = type opaque
%struct.lockdep_map = type {}
%struct.bvec_iter = type { i64, i32, i32, i32 }
%struct.blkcg_gq = type opaque
%struct.bio_issue = type { i64 }
%union.anon.34 = type { %struct.bio_integrity_payload* }
%struct.bio_integrity_payload = type { %struct.bio*, %struct.bvec_iter, i16, i16, i16, i16, %struct.bvec_iter, %struct.work_struct, %struct.bio_vec*, [0 x %struct.bio_vec] }
%struct.bio_vec = type { %struct.page*, i32, i32 }
%struct.bio_set = type { %struct.kmem_cache*, i32, %struct.mempool_s, %struct.mempool_s, %struct.mempool_s, %struct.mempool_s, %struct.spinlock, %struct.bio_list, %struct.work_struct, %struct.workqueue_struct* }
%struct.kmem_cache = type opaque
%struct.mempool_s = type { %struct.spinlock, i32, i32, i8**, i8*, i8* (i32, i8*)*, void (i8*, i8*)*, %struct.wait_queue_head }
%struct.blk_plug = type { %struct.list_head, %struct.list_head, i16, i8, i8 }
%struct.reclaim_state = type opaque
%struct.backing_dev_info = type { i64, %struct.rb_node, %struct.list_head, i64, i64, %struct.kref, i32, i32, i32, i32, %struct.atomic64_t, %struct.bdi_writeback, %struct.list_head, %struct.xarray, %struct.mutex, %struct.rw_semaphore, %struct.wait_queue_head, %struct.device*, [64 x i8], %struct.device*, %struct.timer_list, %struct.dentry* }
%struct.bdi_writeback = type { %struct.backing_dev_info*, i64, i64, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.spinlock, [4 x %struct.percpu_counter], i64, i64, i64, i64, i64, i64, i64, i64, %struct.fprop_local_percpu, i32, i32, %struct.spinlock, %struct.list_head, %struct.delayed_work, i64, %struct.list_head, %struct.percpu_ref, %struct.fprop_local_percpu, %struct.cgroup_subsys_state*, %struct.cgroup_subsys_state*, %struct.list_head, %struct.list_head, %union.anon.33 }
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.fprop_local_percpu = type { %struct.percpu_counter, i32, %struct.raw_spinlock }
%struct.cgroup_subsys_state = type opaque
%union.anon.33 = type { %struct.work_struct }
%struct.xarray = type { %struct.spinlock, i32, i8* }
%struct.io_context = type { %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i16, %struct.xarray, %struct.io_cq*, %struct.hlist_head, %struct.work_struct }
%struct.io_cq = type { %struct.request_queue*, %struct.io_context*, %union.anon.35, %union.anon.36, i32 }
%union.anon.35 = type { %struct.list_head }
%union.anon.36 = type { %struct.hlist_node }
%struct.capture_control = type opaque
%struct.kernel_siginfo = type { %struct.anon.37 }
%struct.anon.37 = type { i32, i32, i32, %union.__sifields }
%union.__sifields = type { %struct.anon.41 }
%struct.anon.41 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i64] }
%struct.css_set = type opaque
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type { %struct.compat_robust_list, i32, i32 }
%struct.compat_robust_list = type { i32 }
%struct.futex_pi_state = type opaque
%struct.perf_event_context = type opaque
%struct.numa_group = type opaque
%struct.rseq = type { i32, i32, %union.anon.48, i32, [12 x i8] }
%union.anon.48 = type { i64 }
%struct.tlbflush_unmap_batch = type { %struct.arch_tlbflush_unmap_batch, i8, i8 }
%struct.arch_tlbflush_unmap_batch = type { %struct.cpumask }
%union.anon.49 = type { %struct.callback_head }
%struct.pipe_inode_info = type opaque
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type opaque
%struct.latency_record = type { [12 x i64], i32, i64, i64 }
%struct.ftrace_ret_stack = type opaque
%struct.request_queue = type { %struct.request*, %struct.elevator_queue*, %struct.percpu_ref, %struct.blk_queue_stats*, %struct.rq_qos*, %struct.blk_mq_ops*, %struct.blk_mq_ctx*, i32, %struct.blk_mq_hw_ctx**, i32, %struct.backing_dev_info*, i8*, i64, %struct.atomic_t, i32, i32, %struct.spinlock, %struct.kobject, %struct.kobject*, %struct.blk_integrity, %struct.device*, i32, i32, i64, i32, i32, i32, i32, %struct.blk_stat_callback*, [16 x %struct.blk_rq_stat], %struct.timer_list, %struct.work_struct, %struct.atomic_t, %struct.list_head, [1 x i64], %struct.blkcg_gq*, %struct.list_head, %struct.queue_limits, i32, i32, i64*, i64*, i32, i32, i32, i32, i32, %struct.mutex, %struct.blk_trace*, %struct.blk_flush_queue*, %struct.list_head, %struct.spinlock, %struct.delayed_work, %struct.mutex, %struct.mutex, %struct.list_head, %struct.spinlock, i32, %struct.bsg_class_device, %struct.throtl_data*, %struct.callback_head, %struct.wait_queue_head, %struct.mutex, %struct.blk_mq_tag_set*, %struct.list_head, %struct.bio_set, %struct.dentry*, %struct.dentry*, %struct.dentry*, i8, i64, [5 x i64] }
%struct.request = type { %struct.request_queue*, %struct.blk_mq_ctx*, %struct.blk_mq_hw_ctx*, i32, i32, i32, i32, i32, i64, %struct.bio*, %struct.bio*, %struct.list_head, %union.anon.82, %union.anon.83, %union.anon.84, %struct.gendisk*, %struct.hd_struct*, i64, i64, i64, i16, i16, i16, i16, i16, i16, i32, %struct.refcount_struct, i32, i64, %union.anon.87, void (%struct.request*, i8)*, i8* }
%struct.blk_mq_hw_ctx = type opaque
%union.anon.82 = type { %struct.hlist_node }
%union.anon.83 = type { %struct.rb_node }
%union.anon.84 = type { %struct.anon.86 }
%struct.anon.86 = type { i32, %struct.list_head, void (%struct.request*, i8)* }
%union.anon.87 = type { %struct.__call_single_data }
%struct.__call_single_data = type { %union.anon.88, void (i8*)*, i8* }
%union.anon.88 = type { %struct.__call_single_node }
%struct.elevator_queue = type { %struct.elevator_type*, i8*, %struct.kobject, %struct.mutex, i8, [64 x %struct.hlist_head] }
%struct.elevator_type = type { %struct.kmem_cache*, %struct.elevator_mq_ops, i64, i64, %struct.elv_fs_entry*, i8*, i8*, i32, %struct.module*, %struct.blk_mq_debugfs_attr*, %struct.blk_mq_debugfs_attr*, [22 x i8], %struct.list_head }
%struct.elevator_mq_ops = type { i32 (%struct.request_queue*, %struct.elevator_type*)*, void (%struct.elevator_queue*)*, i32 (%struct.blk_mq_hw_ctx*, i32)*, void (%struct.blk_mq_hw_ctx*, i32)*, void (%struct.blk_mq_hw_ctx*)*, i1 (%struct.request_queue*, %struct.request*, %struct.bio*)*, i1 (%struct.blk_mq_hw_ctx*, %struct.bio*, i32)*, i32 (%struct.request_queue*, %struct.request**, %struct.bio*)*, void (%struct.request_queue*, %struct.request*, i32)*, void (%struct.request_queue*, %struct.request*, %struct.request*)*, void (i32, %struct.blk_mq_alloc_data*)*, void (%struct.request*)*, void (%struct.request*)*, void (%struct.blk_mq_hw_ctx*, %struct.list_head*, i1)*, %struct.request* (%struct.blk_mq_hw_ctx*)*, i1 (%struct.blk_mq_hw_ctx*)*, void (%struct.request*, i64)*, void (%struct.request*)*, %struct.request* (%struct.request_queue*, %struct.request*)*, %struct.request* (%struct.request_queue*, %struct.request*)*, void (%struct.io_cq*)*, void (%struct.io_cq*)* }
%struct.blk_mq_alloc_data = type opaque
%struct.elv_fs_entry = type { %struct.attribute, i64 (%struct.elevator_queue*, i8*)*, i64 (%struct.elevator_queue*, i8*, i64)* }
%struct.blk_mq_debugfs_attr = type opaque
%struct.blk_queue_stats = type opaque
%struct.rq_qos = type opaque
%struct.blk_mq_ops = type opaque
%struct.blk_mq_ctx = type opaque
%struct.blk_integrity = type { %struct.blk_integrity_profile*, i8, i8, i8, i8 }
%struct.blk_integrity_profile = type { i8 (%struct.blk_integrity_iter*)*, i8 (%struct.blk_integrity_iter*)*, void (%struct.request*)*, void (%struct.request*, i32)*, i8* }
%struct.blk_integrity_iter = type { i8*, i8*, i64, i32, i16, i8* }
%struct.blk_stat_callback = type opaque
%struct.blk_rq_stat = type { i64, i64, i64, i32, i64 }
%struct.queue_limits = type { i64, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i8, i8, i8, i32 }
%struct.blk_trace = type opaque
%struct.blk_flush_queue = type opaque
%struct.bsg_class_device = type { %struct.device*, i32, %struct.request_queue*, %struct.bsg_ops* }
%struct.bsg_ops = type { i32 (%struct.sg_io_v4*)*, i32 (%struct.request*, %struct.sg_io_v4*, i32)*, i32 (%struct.request*, %struct.sg_io_v4*)*, void (%struct.request*)* }
%struct.sg_io_v4 = type { i32, i32, i32, i32, i64, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i64, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32 }
%struct.throtl_data = type opaque
%struct.blk_mq_tag_set = type opaque
%struct.uprobe_task = type { i32, %union.anon.50, %struct.uprobe*, i64, %struct.return_instance*, i32 }
%union.anon.50 = type { %struct.anon.51 }
%struct.anon.51 = type { %struct.arch_uprobe_task, i64 }
%struct.arch_uprobe_task = type { i64, i32, i32 }
%struct.uprobe = type opaque
%struct.return_instance = type { %struct.uprobe*, i64, i64, i64, i8, %struct.return_instance* }
%struct.vm_struct = type { %struct.vm_struct*, i8*, i64, i64, %struct.page**, i32, i64, i8* }
%struct.thread_struct = type { [3 x %struct.desc_struct], i64, i16, i16, i16, i16, i64, i64, [4 x %struct.perf_event*], i64, i64, i64, i64, i64, %struct.io_bitmap*, i64, i8, [47 x i8], %struct.fpu }
%struct.desc_struct = type { i16, i16, i32 }
%struct.perf_event = type opaque
%struct.io_bitmap = type opaque
%struct.fpu = type { i32, i64, [48 x i8], %union.fpregs_state }
%union.fpregs_state = type { %struct.xregs_state, [3520 x i8] }
%struct.xregs_state = type { %struct.fxregs_state, %struct.xstate_header, [0 x i8] }
%struct.fxregs_state = type { i16, i16, i16, i16, %union.anon.53, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.56 }
%union.anon.53 = type { %struct.anon.54 }
%struct.anon.54 = type { i64, i64 }
%union.anon.56 = type { [12 x i32] }
%struct.xstate_header = type { i64, i64, [6 x i64] }
%struct.mmu_notifier_subscriptions = type opaque
%struct.uprobes_state = type { %struct.xol_area* }
%struct.xol_area = type opaque
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.pgprot = type { i64 }
%struct.anon.57 = type { %struct.rb_node, i64 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i64)*, i32 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*, i32)*, void (%struct.vm_fault*, i64, i64)*, i64 (%struct.vm_area_struct*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i64, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.mempolicy*)*, %struct.mempolicy* (%struct.vm_area_struct*, i64)*, %struct.page* (%struct.vm_area_struct*, i64)* }
%struct.vm_fault = type { %struct.vm_area_struct*, i32, i32, i64, i64, %struct.pmd_t*, %struct.pud_t*, %struct.pte_t, %struct.page*, %struct.page*, %struct.pte_t*, %struct.spinlock*, %struct.page* }
%struct.pmd_t = type { i64 }
%struct.pud_t = type { i64 }
%struct.pte_t = type { i64 }
%struct.mempolicy = type opaque
%struct.vm_userfaultfd_ctx = type {}
%struct.file_lock = type { %struct.file_lock*, %struct.list_head, %struct.hlist_node, %struct.list_head, %struct.list_head, i8*, i32, i8, i32, i32, %struct.wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.60 }
%struct.fasync_struct = type { %struct.rwlock_t, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.rwlock_t = type { %struct.qrwlock }
%struct.qrwlock = type { %union.anon.58, %struct.qspinlock }
%union.anon.58 = type { %struct.atomic_t }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i8* (i8*)*, void (i8*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock*, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)*, i1 (%struct.file_lock*)* }
%union.anon.60 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.mutex = type { %struct.atomic64_t, %struct.spinlock, %struct.optimistic_spin_queue, %struct.list_head }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %union.anon.31 }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.user_struct = type { %struct.refcount_struct, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, i64, %struct.atomic64_t, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t, %struct.ratelimit_state }
%struct.ratelimit_state = type { %struct.raw_spinlock, i32, i32, i32, i32, i64, i64 }
%struct.group_info = type { %struct.atomic_t, i32, [0 x %struct.kgid_t] }
%union.anon.31 = type { %struct.callback_head }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.kstat = type { i32, i16, i32, i32, i64, i64, i64, i32, i32, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec64, %struct.timespec64, %struct.timespec64, %struct.timespec64, i64, i64 }
%struct.fiemap_extent_info = type { i32, i32, i32, %struct.fiemap_extent* }
%struct.fiemap_extent = type { i64, i64, i64, [2 x i64], i32, [3 x i32] }
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.fscrypt_operations*, %struct.key*, %struct.fsverity_operations*, %struct.unicode_map*, i16, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, i8*, i32, i64, i64, i32, %struct.fsnotify_mark_connector*, [32 x i8], %struct.uuid_t, i32, i32, %struct.mutex, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, %struct.atomic64_t, i32, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.user_namespace*, %struct.list_lru, %struct.list_lru, %struct.callback_head, %struct.work_struct, %struct.mutex, i32, [4 x i8], %struct.spinlock, %struct.list_head, %struct.spinlock, %struct.list_head, [16 x i8] }
%struct.file_system_type = type { i8*, i32, i32 (%struct.fs_context*)*, %struct.fs_parameter_spec*, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.fs_context = type opaque
%struct.fs_parameter_spec = type opaque
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, %struct.shrink_control*)*, i64 (%struct.super_block*, %struct.shrink_control*)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.spinlock, %struct.atomic_t, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.7, i32 }
%union.anon.7 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.shrink_control = type { i32, i32, i64, i64, %struct.mem_cgroup* }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)*, i32 (%struct.inode*, %struct.kprojid_t*)*, i32 (%struct.inode*, i64*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.kprojid_t = type { i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.qc_info*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.kqid*, %struct.qc_dqblk*)*, i32 (%struct.super_block*, i64, %struct.qc_dqblk*)*, i32 (%struct.super_block*, %struct.qc_state*)*, i32 (%struct.super_block*, i32)* }
%struct.qc_info = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.qc_dqblk = type { i32, i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, i64, i32 }
%struct.qc_state = type { i32, [3 x %struct.qc_type_state] }
%struct.qc_type_state = type { i32, i32, i32, i32, i32, i32, i32, i64, i64, i64 }
%struct.export_operations = type opaque
%struct.xattr_handler = type { i8*, i8*, i32, i1 (%struct.dentry*)*, i32 (%struct.xattr_handler*, %struct.dentry*, %struct.inode*, i8*, i8*, i64)*, i32 (%struct.xattr_handler*, %struct.dentry*, %struct.inode*, i8*, i8*, i64, i32)* }
%struct.fscrypt_operations = type { i32, i8*, i32 (%struct.inode*, i8*, i64)*, i32 (%struct.inode*, i8*, i64, i8*)*, %union.fscrypt_policy* (%struct.super_block*)*, i1 (%struct.inode*)*, i32, i1 (%struct.super_block*)*, void (%struct.super_block*, i32*, i32*)*, i32 (%struct.super_block*)*, void (%struct.super_block*, %struct.request_queue**)* }
%union.fscrypt_policy = type opaque
%struct.fsverity_operations = type { i32 (%struct.file*)*, i32 (%struct.file*, i8*, i64, i64)*, i32 (%struct.inode*, i8*, i64)*, %struct.page* (%struct.inode*, i64, i64)*, i32 (%struct.inode*, i8*, i64, i32)* }
%struct.unicode_map = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.rw_semaphore, [3 x %struct.inode*], [3 x %struct.mem_dqinfo], [3 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, %struct.kqid*)* }
%struct.sb_writers = type { i32, %struct.wait_queue_head, [3 x %struct.percpu_rw_semaphore] }
%struct.percpu_rw_semaphore = type { %struct.rcu_sync, i32*, %struct.rcuwait, %struct.wait_queue_head, %struct.atomic_t }
%struct.rcu_sync = type { i32, i32, %struct.wait_queue_head, %struct.callback_head }
%struct.rcuwait = type { %struct.task_struct* }
%struct.uuid_t = type { [16 x i8] }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i64, i32, i32, %struct.list_head, i32, %struct.atomic64_t* }
%struct.list_lru = type { %struct.list_lru_node*, %struct.list_head, i32, i8 }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_lru_one, %struct.list_lru_memcg*, i64, [16 x i8] }
%struct.list_lru_one = type { %struct.list_head, i64 }
%struct.list_lru_memcg = type { %struct.callback_head, [0 x %struct.list_lru_one*] }
%union.anon.78 = type { i32 }
%struct.timespec64 = type { i64, i64 }
%struct.spinlock = type { %union.anon.3 }
%union.anon.3 = type { %struct.raw_spinlock }
%struct.rw_semaphore = type { %struct.atomic64_t, %struct.atomic64_t, %struct.optimistic_spin_queue, %struct.raw_spinlock, %struct.list_head }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%union.anon.79 = type { %struct.callback_head }
%struct.atomic64_t = type { i64 }
%union.anon.80 = type { %struct.file_operations* }
%struct.file_lock_context = type { %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head }
%struct.address_space = type { %struct.inode*, %struct.xarray, i32, %struct.atomic_t, %struct.atomic_t, %struct.rb_root_cached, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, i32, %struct.spinlock, %struct.list_head, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, void (%struct.readahead_control*)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i1 (%struct.page*, i32)*, void (%struct.page*)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.readahead_control = type { %struct.file*, %struct.address_space*, i64, i32, i32 }
%struct.swap_info_struct = type opaque
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%union.anon.81 = type { %struct.pipe_inode_info* }
%struct.fsnotify_mark_connector = type opaque
%struct.fscrypt_info = type opaque
%struct.fsverity_info = type opaque
%struct.ext4_sb_info = type { i64, i64, i64, i64, i64, i64, i64, i64, i32, i32, i64, i32, i32, i64, %struct.buffer_head*, %struct.ext4_super_block*, %struct.buffer_head**, i32, i32, i64, i32, i64, %struct.atomic64_t, %struct.kuid_t, %struct.kgid_t, i16, i16, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, %struct.percpu_counter, %struct.percpu_counter, %struct.percpu_counter, %struct.percpu_counter, %struct.blockgroup_lock*, %struct.proc_dir_entry*, %struct.kobject, %struct.completion, %struct.super_block*, %struct.journal_s*, %struct.list_head, %struct.mutex, i64, i64, i32, i32, %struct.block_device*, [3 x i8*], i32, i32, %struct.ext4_system_blocks*, %struct.ext4_group_info***, %struct.inode*, %struct.spinlock, i16*, i32*, i32, i32, %struct.list_head, i64, i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32, i32, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.spinlock, i64, i64, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.ext4_locality_group*, i64, i64, i32, i32, %struct.flex_groups**, i32, %struct.workqueue_struct*, %struct.timer_list, %struct.ext4_li_request*, i32, %struct.task_struct*, %struct.atomic_t, %struct.crypto_shash*, i32, %struct.shrinker, %struct.list_head, i64, %struct.ext4_es_stats, %struct.mb_cache*, %struct.mb_cache*, [24 x i8], %struct.spinlock, %struct.ratelimit_state, %struct.ratelimit_state, %struct.ratelimit_state, %struct.atomic_t, %struct.atomic_t, %struct.fscrypt_dummy_policy, %struct.percpu_rw_semaphore, %struct.dax_device*, i32, %struct.spinlock, %struct.atomic_t, %struct.atomic_t, [2 x %struct.list_head], [2 x %struct.list_head], i32, %struct.spinlock, %struct.buffer_head*, %struct.ext4_fc_stats, i64, %struct.ext4_fc_replay_state, [32 x i8] }
%struct.ext4_super_block = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i16, i16, i32, i16, i16, i32, i32, i32, [16 x i8], [16 x i8], [64 x i8], i32, i8, i8, i16, [16 x i8], i32, i32, i32, [4 x i32], i8, i8, i16, i32, i32, i32, [17 x i32], i32, i32, i32, i16, i16, i32, i16, i16, i64, i32, i8, i8, i8, i8, i64, i32, i32, i64, i32, i32, i32, i32, i64, [32 x i8], i32, i32, i32, i32, i64, [32 x i8], [64 x i8], i32, i32, i32, [2 x i32], [4 x i8], [16 x i8], i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i16, i16, [95 x i32], i32 }
%struct.blockgroup_lock = type { [128 x %struct.bgl_lock] }
%struct.bgl_lock = type { %struct.spinlock, [60 x i8] }
%struct.proc_dir_entry = type opaque
%struct.journal_s = type { i64, i32, %struct.mutex, %struct.buffer_head*, %struct.journal_superblock_s*, i32, %struct.rwlock_t, i32, %struct.mutex, %struct.transaction_s*, %struct.transaction_s*, %struct.transaction_s*, %struct.wait_queue_head, %struct.wait_queue_head, %struct.wait_queue_head, %struct.wait_queue_head, %struct.wait_queue_head, %struct.wait_queue_head, %struct.mutex, [64 x %struct.buffer_head*], i64, i64, i64, i64, i64, i64, i64, i64, %struct.block_device*, i32, i64, [56 x i8], %struct.block_device*, i32, %struct.atomic_t, %struct.spinlock, %struct.inode*, i32, i32, i32, i32, [16 x i8], %struct.task_struct*, i32, i32, i64, %struct.timer_list, %struct.spinlock, %struct.jbd2_revoke_table_s*, [2 x %struct.jbd2_revoke_table_s*], %struct.buffer_head**, %struct.buffer_head**, i32, i32, i32, i64, i32, i32, void (%struct.journal_s*, %struct.transaction_s*)*, i32 (%struct.jbd2_inode*)*, i32 (%struct.jbd2_inode*)*, %struct.spinlock, %struct.proc_dir_entry*, %struct.transaction_stats_s, i32, i8*, %struct.crypto_shash*, i32, void (%struct.journal_s*, i32)*, i32 (%struct.journal_s*, %struct.buffer_head*, i32, i32, i32)* }
%struct.journal_superblock_s = type { %struct.journal_header_s, i32, i32, i32, i32, i32, i32, i32, i32, i32, [16 x i8], i32, i32, i32, i32, i8, [3 x i8], i32, [41 x i32], i32, [768 x i8] }
%struct.journal_header_s = type { i32, i32, i32 }
%struct.transaction_s = type { %struct.journal_s*, i32, i32, i64, i32, %struct.journal_head*, %struct.journal_head*, %struct.journal_head*, %struct.journal_head*, %struct.journal_head*, %struct.journal_head*, %struct.list_head, %struct.spinlock, i64, i64, i64, %struct.transaction_chp_stats_s, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.transaction_s*, %struct.transaction_s*, i64, i64, i8, i32, %struct.list_head }
%struct.journal_head = type { %struct.buffer_head*, %struct.spinlock, i32, i32, i32, i8*, i8*, %struct.transaction_s*, %struct.transaction_s*, %struct.journal_head*, %struct.journal_head*, %struct.transaction_s*, %struct.journal_head*, %struct.journal_head*, %struct.jbd2_buffer_trigger_type*, %struct.jbd2_buffer_trigger_type* }
%struct.jbd2_buffer_trigger_type = type { void (%struct.jbd2_buffer_trigger_type*, %struct.buffer_head*, i8*, i64)*, void (%struct.jbd2_buffer_trigger_type*, %struct.buffer_head*)* }
%struct.transaction_chp_stats_s = type { i64, i32, i32, i32 }
%struct.jbd2_revoke_table_s = type opaque
%struct.jbd2_inode = type { %struct.transaction_s*, %struct.transaction_s*, %struct.list_head, %struct.inode*, i64, i64, i64 }
%struct.transaction_stats_s = type { i64, i64, %struct.transaction_run_stats_s }
%struct.transaction_run_stats_s = type { i64, i64, i64, i64, i64, i64, i32, i32, i32 }
%struct.ext4_system_blocks = type { %struct.rb_root, %struct.callback_head }
%struct.ext4_group_info = type { i64, %struct.rb_root, i32, i32, i32, i32, %struct.list_head, %struct.rw_semaphore, [0 x i32] }
%struct.ext4_locality_group = type opaque
%struct.flex_groups = type { %struct.atomic64_t, %struct.atomic_t, %struct.atomic_t }
%struct.ext4_li_request = type { %struct.super_block*, i32, i32, i32, %struct.list_head, i64, i64 }
%struct.crypto_shash = type { i32, %struct.crypto_tfm }
%struct.crypto_tfm = type { i32, i32, void (%struct.crypto_tfm*)*, %struct.crypto_alg*, [0 x i8*] }
%struct.crypto_alg = type { %struct.list_head, %struct.list_head, i32, i32, i32, i32, i32, %struct.refcount_struct, [128 x i8], [128 x i8], %struct.crypto_type*, %union.anon.91, i32 (%struct.crypto_tfm*)*, void (%struct.crypto_tfm*)*, void (%struct.crypto_alg*)*, %struct.module* }
%struct.crypto_type = type opaque
%union.anon.91 = type { %struct.cipher_alg }
%struct.cipher_alg = type { i32, i32, i32 (%struct.crypto_tfm*, i8*, i32)*, void (%struct.crypto_tfm*, i8*, i8*)*, void (%struct.crypto_tfm*, i8*, i8*)* }
%struct.ext4_es_stats = type { i64, %struct.percpu_counter, %struct.percpu_counter, i64, i64, %struct.percpu_counter, %struct.percpu_counter }
%struct.mb_cache = type opaque
%struct.fscrypt_dummy_policy = type { %union.fscrypt_policy* }
%struct.dax_device = type opaque
%struct.buffer_head = type { i64, %struct.buffer_head*, %struct.page*, i64, i64, i8*, %struct.block_device*, void (%struct.buffer_head*, i32)*, i8*, %struct.list_head, %struct.address_space*, %struct.atomic_t, %struct.spinlock }
%struct.ext4_fc_stats = type { [10 x i32], i64, i64, i64 }
%struct.ext4_fc_replay_state = type { i32, i32, i32, i32, i32, %struct.ext4_fc_alloc_region*, i32, i32, i32, i32*, i32, i32 }
%struct.ext4_fc_alloc_region = type { i32, i64, i32, i32 }
%struct.jbd2_journal_handle = type { %union.anon.90, %struct.jbd2_journal_handle*, i32, i32, i32, i32, i32, i32, i64, i32, i32 }
%union.anon.90 = type { %struct.transaction_s* }

@count = dso_local local_unnamed_addr global i32 0, align 4
@user_end = dso_local local_unnamed_addr global i64 140737488355327, align 8
@hugegap = dso_local local_unnamed_addr global i64 -140737488355329, align 8
@hypervisor_begin = dso_local local_unnamed_addr global i64 -140737488355328, align 8
@hypervisor_end = dso_local local_unnamed_addr global i64 -131391639519233, align 8
@phymaps_begin = dso_local local_unnamed_addr global i64 -131391639519232, align 8
@phymaps_end = dso_local local_unnamed_addr global i64 -61022895341569, align 8
@vmalloc_begin = dso_local local_unnamed_addr global i64 -60473139527680, align 8
@vmalloc_end = dso_local local_unnamed_addr global i64 -25288767438849, align 8
@vmemmap_begin = dso_local local_unnamed_addr global i64 -24189255811072, align 8
@vmemmap_end = dso_local local_unnamed_addr global i64 -23089744183297, align 8
@kernel_begin = dso_local local_unnamed_addr global i64 -2147483648, align 8
@kernel_end = dso_local local_unnamed_addr global i64 -1610612737, align 8
@module_start = dso_local local_unnamed_addr global i64 -1610612736, align 8
@module_end = dso_local local_unnamed_addr global i64 -16777217, align 8
@upper_begin = dso_local local_unnamed_addr global i64 -16777216, align 8
@c_user = dso_local local_unnamed_addr global i32 0, align 4
@c_hypervisor = dso_local local_unnamed_addr global i32 0, align 4
@c_phymaps = dso_local local_unnamed_addr global i32 0, align 4
@c_vmalloc = dso_local local_unnamed_addr global i32 0, align 4
@c_vmemmap = dso_local local_unnamed_addr global i32 0, align 4
@c_kernel = dso_local local_unnamed_addr global i32 0, align 4
@c_module = dso_local local_unnamed_addr global i32 0, align 4
@upper = dso_local local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [31 x i8] c"\016==================\0Acount:%u\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"\016c_user:%u\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"\016c_hypervisor:%u\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"\016c_phymaps:%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"\016c_vmalloc:%u\0A\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"\016c_vmemmap:%u\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"\016c_kernel:%u\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"\016c_module:u\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"\016upper:%u\0A=======================\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"fs/ext4/acl.c\00", align 1
@.str.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__func__.ext4_set_acl = private unnamed_addr constant [13 x i8] c"ext4_set_acl\00", align 1
@init_user_ns = external dso_local global %struct.user_namespace, align 1

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define dso_local void @c_print() local_unnamed_addr #0 {
  %1 = load i32, i32* @count, align 4
  %2 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i32 %1) #4
  %3 = load i32, i32* @c_user, align 4
  %4 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %3) #4
  %5 = load i32, i32* @c_hypervisor, align 4
  %6 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i32 %5) #4
  %7 = load i32, i32* @c_phymaps, align 4
  %8 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 %7) #4
  %9 = load i32, i32* @c_vmalloc, align 4
  %10 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i32 %9) #4
  %11 = load i32, i32* @c_vmemmap, align 4
  %12 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i64 0, i64 0), i32 %11) #4
  %13 = load i32, i32* @c_kernel, align 4
  %14 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i32 %13) #4
  %15 = load i32, i32* @c_module, align 4
  %16 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 %15) #4
  %17 = load i32, i32* @upper, align 4
  %18 = tail call i32 (i8*, ...) @printk(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i64 0, i64 0), i32 %17) #4
  ret void
}

; Function Attrs: cold noredzone null_pointer_is_valid
declare dso_local i32 @printk(i8*, ...) local_unnamed_addr #1

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define dso_local zeroext i1 @storeaddr(i64 %0) local_unnamed_addr #0 {
  %2 = load i64, i64* @user_end, align 8
  %3 = icmp ult i64 %2, %0
  br i1 %3, label %4, label %43

4:                                                ; preds = %1
  %5 = load i64, i64* @hypervisor_begin, align 8
  %6 = icmp ugt i64 %5, %0
  %7 = load i64, i64* @hypervisor_end, align 8
  %8 = icmp ult i64 %7, %0
  %9 = or i1 %6, %8
  br i1 %9, label %10, label %43

10:                                               ; preds = %4
  %11 = load i64, i64* @phymaps_begin, align 8
  %12 = icmp ugt i64 %11, %0
  %13 = load i64, i64* @phymaps_end, align 8
  %14 = icmp ult i64 %13, %0
  %15 = or i1 %12, %14
  br i1 %15, label %16, label %43

16:                                               ; preds = %10
  %17 = load i64, i64* @vmalloc_begin, align 8
  %18 = icmp ugt i64 %17, %0
  %19 = load i64, i64* @vmalloc_end, align 8
  %20 = icmp ult i64 %19, %0
  %21 = or i1 %18, %20
  br i1 %21, label %22, label %43

22:                                               ; preds = %16
  %23 = load i64, i64* @vmemmap_begin, align 8
  %24 = icmp ugt i64 %23, %0
  %25 = load i64, i64* @vmemmap_end, align 8
  %26 = icmp ult i64 %25, %0
  %27 = or i1 %24, %26
  br i1 %27, label %28, label %43

28:                                               ; preds = %22
  %29 = load i64, i64* @kernel_begin, align 8
  %30 = icmp ugt i64 %29, %0
  %31 = load i64, i64* @kernel_end, align 8
  %32 = icmp ult i64 %31, %0
  %33 = or i1 %30, %32
  br i1 %33, label %34, label %43

34:                                               ; preds = %28
  %35 = load i64, i64* @module_start, align 8
  %36 = icmp ugt i64 %35, %0
  %37 = load i64, i64* @module_end, align 8
  %38 = icmp ult i64 %37, %0
  %39 = or i1 %36, %38
  br i1 %39, label %40, label %43

40:                                               ; preds = %34
  %41 = load i64, i64* @upper_begin, align 8
  %42 = icmp ugt i64 %41, %0
  br i1 %42, label %47, label %43

43:                                               ; preds = %40, %34, %28, %22, %16, %10, %4, %1
  %44 = phi i32* [ @c_user, %1 ], [ @c_hypervisor, %4 ], [ @c_phymaps, %10 ], [ @c_vmalloc, %16 ], [ @c_vmemmap, %22 ], [ @c_kernel, %28 ], [ @c_module, %34 ], [ @upper, %40 ]
  %45 = load i32, i32* %44, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %44, align 4
  br label %47

47:                                               ; preds = %43, %40
  %48 = load i32, i32* @count, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* @count, align 4
  %50 = urem i32 %49, 100
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %47
  tail call void @c_print() #5
  br label %53

53:                                               ; preds = %52, %47
  ret i1 true
}

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define dso_local %struct.posix_acl* @ext4_get_acl(%struct.inode* %0, i32 %1) local_unnamed_addr #0 {
  switch i32 %1, label %4 [
    i32 32768, label %5
    i32 16384, label %3
  ]

3:                                                ; preds = %2
  br label %5

4:                                                ; preds = %2
  tail call void asm sideeffect "1:\09.byte 0x0f, 0x0b\0A.pushsection __bug_table,\22aw\22\0A2:\09.long 1b - 2b\09# bug_entry::bug_addr\0A\09.long ${0:c} - 2b\09# bug_entry::file\0A\09.word ${1:c}\09# bug_entry::line\0A\09.word ${2:c}\09# bug_entry::flags\0A\09.org 2b+${3:c}\0A.popsection", "i,i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i64 0, i64 0), i32 162, i32 0, i64 12) #6, !srcloc !3
  tail call void asm sideeffect "${0:c}:\0A\09.pushsection .discard.unreachable\0A\09.long ${0:c}b - .\0A\09.popsection\0A\09", "i,~{dirflag},~{fpsr},~{flags}"(i32 326) #6, !srcloc !4
  unreachable

5:                                                ; preds = %3, %2
  %6 = phi i32 [ 3, %3 ], [ 2, %2 ]
  %7 = tail call i32 @ext4_xattr_get(%struct.inode* %0, i32 %6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i64 0, i64 0), i8* null, i64 0) #7
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %105

9:                                                ; preds = %5
  %10 = zext i32 %7 to i64
  %11 = tail call noalias align 8 i8* @__kmalloc(i64 %10, i32 3136) #7
  %12 = icmp eq i8* %11, null
  br i1 %12, label %114, label %13

13:                                               ; preds = %9
  %14 = tail call i32 @ext4_xattr_get(%struct.inode* %0, i32 %6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i64 0, i64 0), i8* nonnull %11, i64 %10) #7
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %105

16:                                               ; preds = %13
  %17 = zext i32 %14 to i64
  %18 = getelementptr i8, i8* %11, i64 %17
  %19 = icmp ult i32 %14, 4
  br i1 %19, label %111, label %20

20:                                               ; preds = %16
  %21 = bitcast i8* %11 to i32*
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %24, label %111

24:                                               ; preds = %20
  %25 = getelementptr i8, i8* %11, i64 4
  %26 = add nsw i64 %17, -4
  %27 = add nsw i64 %17, -20
  %28 = icmp ult i32 %14, 20
  br i1 %28, label %29, label %32

29:                                               ; preds = %24
  %30 = and i64 %26, 3
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %39, label %111

32:                                               ; preds = %24
  %33 = and i64 %27, 7
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %35, label %111

35:                                               ; preds = %32
  %36 = lshr i64 %27, 3
  %37 = trunc i64 %36 to i32
  %38 = add nuw nsw i32 %37, 4
  br label %43

39:                                               ; preds = %29
  %40 = lshr i64 %26, 2
  %41 = trunc i64 %40 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %111, label %43

43:                                               ; preds = %39, %35
  %44 = phi i32 [ %38, %35 ], [ %41, %39 ]
  %45 = tail call %struct.posix_acl* @posix_acl_alloc(i32 %44, i32 3136) #7
  %46 = icmp eq %struct.posix_acl* %45, null
  br i1 %46, label %111, label %47

47:                                               ; preds = %43
  %48 = zext i32 %44 to i64
  br label %49

49:                                               ; preds = %87, %47
  %50 = phi i64 [ 0, %47 ], [ %89, %87 ]
  %51 = phi i8* [ %25, %47 ], [ %88, %87 ]
  %52 = getelementptr i8, i8* %51, i64 4
  %53 = icmp ugt i8* %52, %18
  br i1 %53, label %93, label %54

54:                                               ; preds = %49
  %55 = bitcast i8* %51 to i16*
  %56 = load i16, i16* %55, align 4
  %57 = getelementptr %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 3, i64 %50, i32 0
  %58 = ptrtoint i16* %57 to i64
  %59 = call i1 @storeaddr(i64 %58)
  store i16 %56, i16* %57, align 4
  %60 = getelementptr inbounds i8, i8* %51, i64 2
  %61 = bitcast i8* %60 to i16*
  %62 = load i16, i16* %61, align 2
  %63 = getelementptr %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 3, i64 %50, i32 1
  %64 = ptrtoint i16* %63 to i64
  %65 = call i1 @storeaddr(i64 %64)
  store i16 %62, i16* %63, align 2
  %66 = sext i16 %56 to i32
  switch i32 %66, label %93 [
    i32 1, label %87
    i32 4, label %87
    i32 16, label %87
    i32 32, label %87
    i32 2, label %67
    i32 8, label %77
  ]

67:                                               ; preds = %54
  %68 = getelementptr i8, i8* %51, i64 8
  %69 = icmp ugt i8* %68, %18
  br i1 %69, label %93, label %70

70:                                               ; preds = %67
  %71 = bitcast i8* %52 to i32*
  %72 = load i32, i32* %71, align 4
  %73 = tail call i32 @make_kuid(%struct.user_namespace* nonnull @init_user_ns, i32 %72) #7
  %74 = getelementptr %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 3, i64 %50, i32 2, i32 0, i32 0
  %75 = ptrtoint i32* %74 to i64
  %76 = call i1 @storeaddr(i64 %75)
  store i32 %73, i32* %74, align 4
  br label %87

77:                                               ; preds = %54
  %78 = getelementptr i8, i8* %51, i64 8
  %79 = icmp ugt i8* %78, %18
  br i1 %79, label %93, label %80

80:                                               ; preds = %77
  %81 = bitcast i8* %52 to i32*
  %82 = load i32, i32* %81, align 4
  %83 = tail call i32 @make_kgid(%struct.user_namespace* nonnull @init_user_ns, i32 %82) #7
  %84 = getelementptr %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 3, i64 %50, i32 2, i32 0, i32 0
  %85 = ptrtoint i32* %84 to i64
  %86 = call i1 @storeaddr(i64 %85)
  store i32 %83, i32* %84, align 4
  br label %87

87:                                               ; preds = %80, %70, %54, %54, %54, %54
  %88 = phi i8* [ %78, %80 ], [ %68, %70 ], [ %52, %54 ], [ %52, %54 ], [ %52, %54 ], [ %52, %54 ]
  %89 = add nuw nsw i64 %50, 1
  %90 = icmp eq i64 %89, %48
  br i1 %90, label %91, label %49

91:                                               ; preds = %87
  %92 = icmp eq i8* %88, %18
  br i1 %92, label %111, label %93

93:                                               ; preds = %91, %77, %67, %54, %49
  %94 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 0
  %95 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 0, i32 0, i32 0
  %96 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; xaddl $0, $1\0A", "=r,=*m,0,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %95, i32 -1, i32* %95) #6, !srcloc !5
  %97 = icmp eq i32 %96, 1
  br i1 %97, label %103, label %98

98:                                               ; preds = %93
  %99 = add i32 %96, -1
  %100 = or i32 %99, %96
  %101 = icmp sgt i32 %100, -1
  br i1 %101, label %111, label %102, !prof !6, !misexpect !7

102:                                              ; preds = %98
  tail call void @refcount_warn_saturate(%struct.refcount_struct* %94, i32 3) #7
  br label %111

103:                                              ; preds = %93
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  %104 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %45, i64 0, i32 1
  tail call void @kvfree_call_rcu(%struct.callback_head* %104, void (%struct.callback_head*)* nonnull inttoptr (i64 8 to void (%struct.callback_head*)*)) #7
  br label %111

105:                                              ; preds = %13, %5
  %106 = phi i32 [ %14, %13 ], [ %7, %5 ]
  %107 = phi i8* [ %11, %13 ], [ null, %5 ]
  switch i32 %106, label %108 [
    i32 -38, label %111
    i32 -61, label %111
  ]

108:                                              ; preds = %105
  %109 = sext i32 %106 to i64
  %110 = inttoptr i64 %109 to %struct.posix_acl*
  br label %111

111:                                              ; preds = %108, %105, %105, %103, %102, %98, %91, %43, %39, %32, %29, %20, %16
  %112 = phi i8* [ %107, %108 ], [ %107, %105 ], [ %107, %105 ], [ %11, %16 ], [ %11, %20 ], [ %11, %29 ], [ %11, %32 ], [ %11, %39 ], [ %11, %43 ], [ %11, %91 ], [ %11, %98 ], [ %11, %102 ], [ %11, %103 ]
  %113 = phi %struct.posix_acl* [ %110, %108 ], [ null, %105 ], [ null, %105 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %16 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %20 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %29 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %32 ], [ null, %39 ], [ inttoptr (i64 -12 to %struct.posix_acl*), %43 ], [ %45, %91 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %98 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %102 ], [ inttoptr (i64 -22 to %struct.posix_acl*), %103 ]
  tail call void @kfree(i8* %112) #7
  br label %114

114:                                              ; preds = %111, %9
  %115 = phi %struct.posix_acl* [ %113, %111 ], [ inttoptr (i64 -12 to %struct.posix_acl*), %9 ]
  ret %struct.posix_acl* %115
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @ext4_xattr_get(%struct.inode*, i32, i8*, i8*, i64) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @kfree(i8*) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define dso_local i32 @ext4_set_acl(%struct.inode* %0, %struct.posix_acl* %1, i32 %2) local_unnamed_addr #0 {
  %4 = alloca %struct.posix_acl*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = ptrtoint %struct.posix_acl** %4 to i64
  %9 = call i1 @storeaddr(i64 %8)
  store %struct.posix_acl* %1, %struct.posix_acl** %4, align 8
  %10 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #6
  %11 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #6
  %12 = ptrtoint i32* %6 to i64
  %13 = call i1 @storeaddr(i64 %12)
  store i32 0, i32* %6, align 4
  %14 = icmp eq %struct.posix_acl* %1, null
  br i1 %14, label %28, label %15

15:                                               ; preds = %3
  %16 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %1, i64 0, i32 2
  %17 = load i32, i32* %16, align 8
  %18 = icmp slt i32 %17, 5
  br i1 %18, label %19, label %23

19:                                               ; preds = %15
  %20 = sext i32 %17 to i64
  %21 = shl nsw i64 %20, 2
  %22 = add nsw i64 %21, 4
  br label %28

23:                                               ; preds = %15
  %24 = add nsw i32 %17, -4
  %25 = zext i32 %24 to i64
  %26 = shl nuw nsw i64 %25, 3
  %27 = add nuw nsw i64 %26, 20
  br label %28

28:                                               ; preds = %23, %19, %3
  %29 = phi i64 [ 0, %3 ], [ %22, %19 ], [ %27, %23 ]
  %30 = bitcast i16* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 2, i8* nonnull %30) #6
  %31 = getelementptr inbounds %struct.inode, %struct.inode* %0, i64 0, i32 0
  %32 = load i16, i16* %31, align 8
  %33 = ptrtoint i16* %7 to i64
  %34 = call i1 @storeaddr(i64 %33)
  store i16 %32, i16* %7, align 2
  %35 = tail call i32 @dquot_initialize(%struct.inode* %0) #7
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %101

37:                                               ; preds = %28
  %38 = getelementptr inbounds %struct.inode, %struct.inode* %0, i64 0, i32 8
  %39 = icmp eq i32 %2, 32768
  %40 = getelementptr inbounds %struct.inode, %struct.inode* %0, i64 0, i32 17, i32 0
  %41 = getelementptr inbounds %struct.inode, %struct.inode* %0, i64 0, i32 17, i32 1
  br label %42

42:                                               ; preds = %97, %37
  %43 = phi i32 [ %93, %97 ], [ 0, %37 ]
  %44 = call i32 @ext4_xattr_set_credits(%struct.inode* %0, i64 %29, i1 zeroext false, i32* nonnull %5) #7
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %101

46:                                               ; preds = %42
  %47 = load i32, i32* %5, align 4
  %48 = load %struct.super_block*, %struct.super_block** %38, align 8
  %49 = getelementptr inbounds %struct.super_block, %struct.super_block* %48, i64 0, i32 33
  %50 = bitcast i8** %49 to %struct.ext4_sb_info**
  %51 = load %struct.ext4_sb_info*, %struct.ext4_sb_info** %50, align 8
  %52 = getelementptr inbounds %struct.ext4_sb_info, %struct.ext4_sb_info* %51, i64 0, i32 11
  %53 = load i32, i32* %52, align 16
  %54 = shl i32 %53, 3
  %55 = call %struct.jbd2_journal_handle* @__ext4_journal_start_sb(%struct.super_block* %48, i32 244, i32 10, i32 %47, i32 0, i32 %54) #7
  %56 = icmp ugt %struct.jbd2_journal_handle* %55, inttoptr (i64 -4096 to %struct.jbd2_journal_handle*)
  br i1 %56, label %57, label %60

57:                                               ; preds = %46
  %58 = ptrtoint %struct.jbd2_journal_handle* %55 to i64
  %59 = trunc i64 %58 to i32
  br label %101

60:                                               ; preds = %46
  call void @ext4_fc_start_update(%struct.inode* %0) #7
  %61 = load %struct.posix_acl*, %struct.posix_acl** %4, align 8
  %62 = icmp ne %struct.posix_acl* %61, null
  %63 = and i1 %39, %62
  br i1 %63, label %64, label %73

64:                                               ; preds = %60
  %65 = call i32 @posix_acl_update_mode(%struct.inode* %0, i16* nonnull %7, %struct.posix_acl** nonnull %4) #7
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %92

67:                                               ; preds = %64
  %68 = load i16, i16* %7, align 2
  %69 = load i16, i16* %31, align 8
  %70 = icmp eq i16 %68, %69
  %71 = select i1 %70, i32 %43, i32 1
  %72 = load %struct.posix_acl*, %struct.posix_acl** %4, align 8
  br label %73

73:                                               ; preds = %67, %60
  %74 = phi %struct.posix_acl* [ %61, %60 ], [ %72, %67 ]
  %75 = phi i32 [ %43, %60 ], [ %71, %67 ]
  %76 = call fastcc i32 @__ext4_set_acl(%struct.jbd2_journal_handle* %55, %struct.inode* %0, i32 %2, %struct.posix_acl* %74, i32 0) #5
  %77 = icmp eq i32 %76, 0
  %78 = icmp ne i32 %75, 0
  %79 = and i1 %78, %77
  br i1 %79, label %80, label %92

80:                                               ; preds = %73
  %81 = load i16, i16* %7, align 2
  %82 = ptrtoint i16* %31 to i64
  %83 = call i1 @storeaddr(i64 %82)
  store i16 %81, i16* %31, align 8
  %84 = call { i64, i64 } @current_time(%struct.inode* %0) #7
  %85 = extractvalue { i64, i64 } %84, 0
  %86 = extractvalue { i64, i64 } %84, 1
  %87 = ptrtoint i64* %40 to i64
  %88 = call i1 @storeaddr(i64 %87)
  store i64 %85, i64* %40, align 8
  %89 = ptrtoint i64* %41 to i64
  %90 = call i1 @storeaddr(i64 %89)
  store i64 %86, i64* %41, align 8
  %91 = call i32 @__ext4_mark_inode_dirty(%struct.jbd2_journal_handle* %55, %struct.inode* %0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @__func__.ext4_set_acl, i64 0, i64 0), i32 261) #7
  br label %92

92:                                               ; preds = %80, %73, %64
  %93 = phi i32 [ %43, %64 ], [ 1, %80 ], [ %75, %73 ]
  %94 = phi i32 [ %65, %64 ], [ %91, %80 ], [ %76, %73 ]
  %95 = call i32 @__ext4_journal_stop(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @__func__.ext4_set_acl, i64 0, i64 0), i32 264, %struct.jbd2_journal_handle* %55) #7
  call void @ext4_fc_stop_update(%struct.inode* %0) #7
  %96 = icmp eq i32 %94, -28
  br i1 %96, label %97, label %101

97:                                               ; preds = %92
  %98 = load %struct.super_block*, %struct.super_block** %38, align 8
  %99 = call i32 @ext4_should_retry_alloc(%struct.super_block* %98, i32* nonnull %6) #7
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %42

101:                                              ; preds = %97, %92, %57, %42, %28
  %102 = phi i32 [ %59, %57 ], [ %35, %28 ], [ %94, %92 ], [ -28, %97 ], [ %44, %42 ]
  call void @llvm.lifetime.end.p0i8(i64 2, i8* nonnull %30) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #6
  ret i32 %102
}

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @dquot_initialize(%struct.inode*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @ext4_xattr_set_credits(%struct.inode*, i64, i1 zeroext, i32*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @ext4_fc_start_update(%struct.inode*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @posix_acl_update_mode(%struct.inode*, i16*, %struct.posix_acl**) local_unnamed_addr #3

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define internal fastcc i32 @__ext4_set_acl(%struct.jbd2_journal_handle* %0, %struct.inode* %1, i32 %2, %struct.posix_acl* %3, i32 %4) unnamed_addr #0 {
  switch i32 %2, label %94 [
    i32 32768, label %14
    i32 16384, label %6
  ]

6:                                                ; preds = %5
  %7 = getelementptr inbounds %struct.inode, %struct.inode* %1, i64 0, i32 0
  %8 = load i16, i16* %7, align 8
  %9 = and i16 %8, -4096
  %10 = icmp eq i16 %9, 16384
  br i1 %10, label %14, label %11

11:                                               ; preds = %6
  %12 = icmp eq %struct.posix_acl* %3, null
  %13 = select i1 %12, i32 0, i32 -13
  br label %94

14:                                               ; preds = %6, %5
  %15 = phi i32 [ 3, %6 ], [ 2, %5 ]
  %16 = icmp eq %struct.posix_acl* %3, null
  br i1 %16, label %88, label %17

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %3, i64 0, i32 2
  %19 = load i32, i32* %18, align 8
  %20 = icmp slt i32 %19, 5
  %21 = add nsw i32 %19, -4
  %22 = zext i32 %21 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = sext i32 %19 to i64
  %25 = shl nsw i64 %24, 2
  %26 = select i1 %20, i64 4, i64 20
  %27 = select i1 %20, i64 %25, i64 %23
  %28 = add nsw i64 %27, %26
  %29 = zext i32 %19 to i64
  %30 = shl nuw nsw i64 %29, 3
  %31 = or i64 %30, 4
  %32 = tail call noalias align 8 i8* @__kmalloc(i64 %31, i32 3136) #7
  %33 = icmp eq i8* %32, null
  br i1 %33, label %84, label %34

34:                                               ; preds = %17
  %35 = bitcast i8* %32 to i32*
  %36 = ptrtoint i32* %35 to i64
  %37 = call i1 @storeaddr(i64 %36)
  store i32 1, i32* %35, align 8
  %38 = load i32, i32* %18, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %82, label %40

40:                                               ; preds = %34
  %41 = getelementptr i8, i8* %32, i64 4
  br label %42

42:                                               ; preds = %74, %40
  %43 = phi i8* [ %76, %74 ], [ %41, %40 ]
  %44 = phi i64 [ %77, %74 ], [ 0, %40 ]
  %45 = getelementptr %struct.posix_acl, %struct.posix_acl* %3, i64 0, i32 3, i64 %44, i32 0
  %46 = load i16, i16* %45, align 4
  %47 = bitcast i8* %43 to i16*
  %48 = ptrtoint i16* %47 to i64
  %49 = call i1 @storeaddr(i64 %48)
  store i16 %46, i16* %47, align 4
  %50 = getelementptr %struct.posix_acl, %struct.posix_acl* %3, i64 0, i32 3, i64 %44, i32 1
  %51 = load i16, i16* %50, align 2
  %52 = getelementptr inbounds i8, i8* %43, i64 2
  %53 = bitcast i8* %52 to i16*
  %54 = ptrtoint i16* %53 to i64
  %55 = call i1 @storeaddr(i64 %54)
  store i16 %51, i16* %53, align 2
  %56 = load i16, i16* %45, align 4
  %57 = sext i16 %56 to i32
  switch i32 %57, label %81 [
    i32 2, label %58
    i32 8, label %66
    i32 1, label %74
    i32 4, label %74
    i32 16, label %74
    i32 32, label %74
  ]

58:                                               ; preds = %42
  %59 = getelementptr %struct.posix_acl, %struct.posix_acl* %3, i64 0, i32 3, i64 %44, i32 2, i32 0, i32 0
  %60 = load i32, i32* %59, align 4
  %61 = tail call i32 @from_kuid(%struct.user_namespace* nonnull @init_user_ns, i32 %60) #7
  %62 = getelementptr inbounds i8, i8* %43, i64 4
  %63 = bitcast i8* %62 to i32*
  %64 = ptrtoint i32* %63 to i64
  %65 = call i1 @storeaddr(i64 %64)
  store i32 %61, i32* %63, align 4
  br label %74

66:                                               ; preds = %42
  %67 = getelementptr %struct.posix_acl, %struct.posix_acl* %3, i64 0, i32 3, i64 %44, i32 2, i32 0, i32 0
  %68 = load i32, i32* %67, align 4
  %69 = tail call i32 @from_kgid(%struct.user_namespace* nonnull @init_user_ns, i32 %68) #7
  %70 = getelementptr inbounds i8, i8* %43, i64 4
  %71 = bitcast i8* %70 to i32*
  %72 = ptrtoint i32* %71 to i64
  %73 = call i1 @storeaddr(i64 %72)
  store i32 %69, i32* %71, align 4
  br label %74

74:                                               ; preds = %66, %58, %42, %42, %42, %42
  %75 = phi i64 [ 8, %66 ], [ 8, %58 ], [ 4, %42 ], [ 4, %42 ], [ 4, %42 ], [ 4, %42 ]
  %76 = getelementptr i8, i8* %43, i64 %75
  %77 = add nuw nsw i64 %44, 1
  %78 = load i32, i32* %18, align 8
  %79 = zext i32 %78 to i64
  %80 = icmp ult i64 %77, %79
  br i1 %80, label %42, label %82

81:                                               ; preds = %42
  tail call void @kfree(i8* nonnull %32) #7
  br label %84

82:                                               ; preds = %74, %34
  %83 = icmp ugt i8* %32, inttoptr (i64 -4096 to i8*)
  br i1 %83, label %84, label %88

84:                                               ; preds = %82, %81, %17
  %85 = phi i8* [ %32, %82 ], [ inttoptr (i64 -12 to i8*), %17 ], [ inttoptr (i64 -22 to i8*), %81 ]
  %86 = ptrtoint i8* %85 to i64
  %87 = trunc i64 %86 to i32
  br label %94

88:                                               ; preds = %82, %14
  %89 = phi i64 [ 0, %14 ], [ %28, %82 ]
  %90 = phi i8* [ null, %14 ], [ %32, %82 ]
  %91 = tail call i32 @ext4_xattr_set_handle(%struct.jbd2_journal_handle* %0, %struct.inode* %1, i32 %15, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i64 0, i64 0), i8* %90, i64 %89, i32 %4) #7
  tail call void @kfree(i8* %90) #7
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %94

93:                                               ; preds = %88
  tail call void @set_cached_acl(%struct.inode* %1, i32 %2, %struct.posix_acl* %3) #7
  br label %94

94:                                               ; preds = %93, %88, %84, %11, %5
  %95 = phi i32 [ %87, %84 ], [ %13, %11 ], [ -22, %5 ], [ %91, %88 ], [ 0, %93 ]
  ret i32 %95
}

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local { i64, i64 } @current_time(%struct.inode*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @__ext4_mark_inode_dirty(%struct.jbd2_journal_handle*, %struct.inode*, i8*, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @__ext4_journal_stop(i8*, i32, %struct.jbd2_journal_handle*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @ext4_fc_stop_update(%struct.inode*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @ext4_should_retry_alloc(%struct.super_block*, i32*) local_unnamed_addr #3

; Function Attrs: noredzone nounwind null_pointer_is_valid sspstrong
define dso_local i32 @ext4_init_acl(%struct.jbd2_journal_handle* %0, %struct.inode* %1, %struct.inode* %2) local_unnamed_addr #0 {
  %4 = alloca %struct.posix_acl*, align 8
  %5 = alloca %struct.posix_acl*, align 8
  %6 = bitcast %struct.posix_acl** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #6
  %7 = bitcast %struct.posix_acl** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #6
  %8 = getelementptr inbounds %struct.inode, %struct.inode* %1, i64 0, i32 0
  %9 = call i32 @posix_acl_create(%struct.inode* %2, i16* %8, %struct.posix_acl** nonnull %4, %struct.posix_acl** nonnull %5) #7
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %65

11:                                               ; preds = %3
  %12 = load %struct.posix_acl*, %struct.posix_acl** %4, align 8
  %13 = icmp eq %struct.posix_acl* %12, null
  br i1 %13, label %33, label %14

14:                                               ; preds = %11
  %15 = call fastcc i32 @__ext4_set_acl(%struct.jbd2_journal_handle* %0, %struct.inode* %1, i32 16384, %struct.posix_acl* nonnull %12, i32 1) #5
  %16 = load %struct.posix_acl*, %struct.posix_acl** %4, align 8
  %17 = icmp eq %struct.posix_acl* %16, null
  br i1 %17, label %30, label %18

18:                                               ; preds = %14
  %19 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %16, i64 0, i32 0
  %20 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %16, i64 0, i32 0, i32 0, i32 0
  %21 = call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; xaddl $0, $1\0A", "=r,=*m,0,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %20, i32 -1, i32* %20) #6, !srcloc !5
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %28, label %23

23:                                               ; preds = %18
  %24 = add i32 %21, -1
  %25 = or i32 %24, %21
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %30, label %27, !prof !6, !misexpect !7

27:                                               ; preds = %23
  call void @refcount_warn_saturate(%struct.refcount_struct* %19, i32 3) #7
  br label %30

28:                                               ; preds = %18
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  %29 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %16, i64 0, i32 1
  call void @kvfree_call_rcu(%struct.callback_head* %29, void (%struct.callback_head*)* nonnull inttoptr (i64 8 to void (%struct.callback_head*)*)) #7
  br label %30

30:                                               ; preds = %28, %27, %23, %14
  %31 = load %struct.posix_acl*, %struct.posix_acl** %5, align 8
  %32 = icmp eq %struct.posix_acl* %31, null
  br i1 %32, label %60, label %39

33:                                               ; preds = %11
  %34 = getelementptr inbounds %struct.inode, %struct.inode* %1, i64 0, i32 6
  %35 = ptrtoint %struct.posix_acl** %34 to i64
  %36 = call i1 @storeaddr(i64 %35)
  store %struct.posix_acl* null, %struct.posix_acl** %34, align 8
  %37 = load %struct.posix_acl*, %struct.posix_acl** %5, align 8
  %38 = icmp eq %struct.posix_acl* %37, null
  br i1 %38, label %60, label %41

39:                                               ; preds = %30
  %40 = icmp eq i32 %15, 0
  br i1 %40, label %41, label %46

41:                                               ; preds = %39, %33
  %42 = phi %struct.posix_acl* [ %31, %39 ], [ %37, %33 ]
  %43 = call fastcc i32 @__ext4_set_acl(%struct.jbd2_journal_handle* %0, %struct.inode* %1, i32 32768, %struct.posix_acl* nonnull %42, i32 1) #5
  %44 = load %struct.posix_acl*, %struct.posix_acl** %5, align 8
  %45 = icmp eq %struct.posix_acl* %44, null
  br i1 %45, label %65, label %46

46:                                               ; preds = %41, %39
  %47 = phi i32 [ %43, %41 ], [ %15, %39 ]
  %48 = phi %struct.posix_acl* [ %44, %41 ], [ %31, %39 ]
  %49 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %48, i64 0, i32 0
  %50 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %48, i64 0, i32 0, i32 0, i32 0
  %51 = call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; xaddl $0, $1\0A", "=r,=*m,0,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %50, i32 -1, i32* %50) #6, !srcloc !5
  %52 = icmp eq i32 %51, 1
  br i1 %52, label %58, label %53

53:                                               ; preds = %46
  %54 = add i32 %51, -1
  %55 = or i32 %54, %51
  %56 = icmp sgt i32 %55, -1
  br i1 %56, label %65, label %57, !prof !6, !misexpect !7

57:                                               ; preds = %53
  call void @refcount_warn_saturate(%struct.refcount_struct* %49, i32 3) #7
  br label %65

58:                                               ; preds = %46
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !8
  %59 = getelementptr inbounds %struct.posix_acl, %struct.posix_acl* %48, i64 0, i32 1
  call void @kvfree_call_rcu(%struct.callback_head* %59, void (%struct.callback_head*)* nonnull inttoptr (i64 8 to void (%struct.callback_head*)*)) #7
  br label %65

60:                                               ; preds = %33, %30
  %61 = phi i32 [ 0, %33 ], [ %15, %30 ]
  %62 = getelementptr inbounds %struct.inode, %struct.inode* %1, i64 0, i32 5
  %63 = ptrtoint %struct.posix_acl** %62 to i64
  %64 = call i1 @storeaddr(i64 %63)
  store %struct.posix_acl* null, %struct.posix_acl** %62, align 8
  br label %65

65:                                               ; preds = %60, %58, %57, %53, %41, %3
  %66 = phi i32 [ %9, %3 ], [ %61, %60 ], [ %43, %41 ], [ %47, %53 ], [ %47, %57 ], [ %47, %58 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #6
  ret i32 %66
}

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @posix_acl_create(%struct.inode*, i16*, %struct.posix_acl**, %struct.posix_acl**) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local noalias i8* @__kmalloc(i64, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local %struct.posix_acl* @posix_acl_alloc(i32, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @make_kuid(%struct.user_namespace*, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @make_kgid(%struct.user_namespace*, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local %struct.jbd2_journal_handle* @__ext4_journal_start_sb(%struct.super_block*, i32, i32, i32, i32, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @ext4_xattr_set_handle(%struct.jbd2_journal_handle*, %struct.inode*, i32, i8*, i8*, i64, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @set_cached_acl(%struct.inode*, i32, %struct.posix_acl*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @from_kuid(%struct.user_namespace*, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local i32 @from_kgid(%struct.user_namespace*, i32) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @kvfree_call_rcu(%struct.callback_head*, void (%struct.callback_head*)*) local_unnamed_addr #3

; Function Attrs: noredzone null_pointer_is_valid
declare dso_local void @refcount_warn_saturate(%struct.refcount_struct*, i32) local_unnamed_addr #3

attributes #0 = { noredzone nounwind null_pointer_is_valid sspstrong "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fentry-call"="true" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noredzone null_pointer_is_valid "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { noredzone null_pointer_is_valid "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+retpoline-external-thunk,+retpoline-indirect-branches,+retpoline-indirect-calls,-3dnow,-3dnowa,-aes,-avx,-avx2,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-f16c,-fma,-fma4,-gfni,-mmx,-pclmul,-sha,-sse,-sse2,-sse3,-sse4.1,-sse4.2,-sse4a,-ssse3,-vaes,-vpclmulqdq,-x87,-xop" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { cold noredzone nounwind }
attributes #5 = { noredzone }
attributes #6 = { nounwind }
attributes #7 = { noredzone nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 1, !"Code Model", i32 2}
!2 = !{!"clang version 11.1.0"}
!3 = !{i32 -2140768706, i32 -2140768677, i32 -2140768631, i32 -2140768573, i32 -2140768519, i32 -2140768465, i32 -2140768410, i32 -2140768379}
!4 = !{i32 -2140767934, i32 -2140767927, i32 -2140767873, i32 -2140767842, i32 -2140767812}
!5 = !{i32 -2146009826, i32 -2146009787, i32 -2146009766, i32 -2146009729, i32 -2146009706, i32 -2146009697}
!6 = !{!"branch_weights", i32 2000, i32 1}
!7 = !{!"misexpect", i64 1, i64 2000, i64 1}
!8 = !{i32 -2144152886}
