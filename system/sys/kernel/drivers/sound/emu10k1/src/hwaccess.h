/*
 **********************************************************************
 *     hwaccess.h
 *     Copyright 1999, 2000 Creative Labs, Inc.
 *
 **********************************************************************
 *
 *     Date		    Author	    Summary of changes
 *     ----		    ------	    ------------------
 *     October 20, 1999     Bertrand Lee    base code release
 *
 **********************************************************************
 *
 *     This program is free software; you can redistribute it and/or
 *     modify it under the terms of the GNU General Public License as
 *     published by the Free Software Foundation; either version 2 of
 *     the License, or (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public
 *     License along with this program; if not, write to the Free
 *     Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139,
 *     USA.
 *
 **********************************************************************
 */

#ifndef _HWACCESS_H
#define _HWACCESS_H

#include "emu_wrapper.h"
#include <atheos/soundcard.h>
#include "ac97_codec.h"
#include <atheos/kernel.h>
#include <atheos/pci.h>
#include <atheos/isa_io.h>
#include <atheos/semaphore.h>
#include <atheos/spinlock.h>

#include "emu_wrapper.h"
#include "efxmgr.h"

#define EMUPAGESIZE     4096            /* don't change */
#define NUM_G           64              /* use all channels */
#define NUM_FXSENDS     4               /* don't change */
/* setting this to other than a power of two may break some applications */
#define MAXBUFSIZE	1024000
//#define MAXBUFSIZE	65536
#define MAXPAGES	8192 
#define BUFMAXPAGES     (MAXBUFSIZE / PAGE_SIZE)

#define FLAGS_AVAILABLE     0x0001
#define FLAGS_READY         0x0002

struct memhandle
{
	dma_addr_t dma_handle;
	void *addr;
	uint32 size;
};

#define DEBUG_LEVEL 2

#ifdef EMU10K1_DEBUG
# define DPD(level,x,y...) do {if(level <= DEBUG_LEVEL) printk( KERN_NOTICE "emu10k1: %s: %d: " x , __FILE__ , __LINE__ , y );} while(0)
# define DPF(level,x)   do {if(level <= DEBUG_LEVEL) printk( KERN_NOTICE "emu10k1: %s: %d: " x , __FILE__ , __LINE__ );} while(0)
#else
# define DPD(level,x,y...) do { } while (0) /* not debugging: nothing */
# define DPF(level,x) do { } while (0)
#endif /* EMU10K1_DEBUG */

#define ERROR() DPF(1,"error\n")

/* DATA STRUCTURES */

struct emu10k1_waveout
{
	u32 send_routing[3];
	// audigy only:
	u32 send_routing2[3];

	u32 send_dcba[3];
	// audigy only:
	u32 send_hgfe[3];
};

#define ROUTE_PCM 0
#define ROUTE_PT 1
#define ROUTE_PCM1 2

#define SEND_MONO 0
#define SEND_LEFT 1
#define SEND_RIGHT 2

struct emu10k1_wavein
{
        struct wiinst *ac97;
        struct wiinst *mic;
        struct wiinst *fx;

        uint8 recsrc;
        uint32 fxwc;
};

#define CMD_READ 1
#define CMD_WRITE 2

struct mixer_private_ioctl {
        uint32 cmd;
        uint32 val[90];
};

/* bogus ioctls numbers to escape from OSS mixer limitations */
#define CMD_WRITEFN0            _IOW('D', 0, struct mixer_private_ioctl)
#define CMD_READFN0		_IOR('D', 1, struct mixer_private_ioctl) 
#define CMD_WRITEPTR		_IOW('D', 2, struct mixer_private_ioctl) 
#define CMD_READPTR		_IOR('D', 3, struct mixer_private_ioctl) 
#define CMD_SETRECSRC		_IOW('D', 4, struct mixer_private_ioctl) 
#define CMD_GETRECSRC		_IOR('D', 5, struct mixer_private_ioctl) 
#define CMD_GETVOICEPARAM	_IOR('D', 6, struct mixer_private_ioctl) 
#define CMD_SETVOICEPARAM	_IOW('D', 7, struct mixer_private_ioctl) 
#define CMD_GETPATCH		_IOR('D', 8, struct mixer_private_ioctl) 
#define CMD_GETGPR		_IOR('D', 9, struct mixer_private_ioctl) 
#define CMD_GETCTLGPR           _IOR('D', 10, struct mixer_private_ioctl)
#define CMD_SETPATCH		_IOW('D', 11, struct mixer_private_ioctl) 
#define CMD_SETGPR		_IOW('D', 12, struct mixer_private_ioctl) 
#define CMD_SETCTLGPR		_IOW('D', 13, struct mixer_private_ioctl)
#define CMD_SETGPOUT		_IOW('D', 14, struct mixer_private_ioctl)
#define CMD_GETGPR2OSS		_IOR('D', 15, struct mixer_private_ioctl)
#define CMD_SETGPR2OSS		_IOW('D', 16, struct mixer_private_ioctl)
#define CMD_SETMCH_FX		_IOW('D', 17, struct mixer_private_ioctl)
#define CMD_SETPASSTHROUGH	_IOW('D', 18, struct mixer_private_ioctl)
#define CMD_PRIVATE3_VERSION	_IOW('D', 19, struct mixer_private_ioctl)
#define CMD_AC97_BOOST		_IOW('D', 20, struct mixer_private_ioctl)

//up this number when breaking compatibility
#define PRIVATE3_VERSION 2

struct emu10k1_card 
{
	struct list_head list;

	struct memhandle	virtualpagetable;
	struct memhandle	tankmem;
	struct memhandle	silentpage;

	SpinLock_s		lock;

	uint8			voicetable[NUM_G];
	uint16			emupagetable[MAXPAGES];

	struct list_head	timers;
	unsigned		timer_delay;
	SpinLock_s		timer_lock;

	PCI_Info_s		*pci_dev;
	unsigned long           iobase;
	unsigned long		length;
	unsigned short		model;
	unsigned int irq; 

	int	audio_dev;
	int	audio_dev1;
	int	midi_dev;

	struct ac97_codec ac97;
	int ac97_supported_mixers;
	int ac97_stereo_mixers;

	/* Number of first fx voice for multichannel output */
	uint8 mchannel_fx;
	struct emu10k1_waveout	waveout;
	struct emu10k1_wavein	wavein;
	struct emu10k1_mpuout	*mpuout;
	struct emu10k1_mpuin	*mpuin;

	sem_id	open_sem;
	uint32	open_mode;
	sem_id	open_wait;

	uint32	    mpuacqcount;	  // Mpu acquire count
	uint32	    has_toslink;	       // TOSLink detection

	uint8 chiprev;                    /* Chip revision                */

	u8 is_audigy;
	u8 is_aps;

	struct patch_manager mgr;
//	struct pt_data pt;

	int irq_handle;
	int dev_id;
};

int emu10k1_addxmgr_alloc(uint32, struct emu10k1_card *);
void emu10k1_addxmgr_free(struct emu10k1_card *, int);



int emu10k1_find_control_gpr(struct patch_manager *, const char *, const char *);
void emu10k1_set_control_gpr(struct emu10k1_card *, int , int32, int );

void emu10k1_set_volume_gpr(struct emu10k1_card *, int, int32, int);


#define VOL_6BIT 0x40
#define VOL_5BIT 0x20
#define VOL_4BIT 0x10

#define TIMEOUT 		    16384

uint32 srToPitch(uint32);
uint8 sumVolumeToAttenuation(uint32);

extern struct list_head emu10k1_devs;

/* Hardware Abstraction Layer access functions */

void emu10k1_writefn0(struct emu10k1_card *, uint32 , uint32 );
uint32 emu10k1_readfn0(struct emu10k1_card *, uint32 );

void emu10k1_timer_set(struct emu10k1_card *, u16);

void sblive_writeptr(struct emu10k1_card *, uint32 , uint32 , uint32 );
void sblive_writeptr_tag(struct emu10k1_card *card, uint32 channel, ...);
#define TAGLIST_END	0

uint32 sblive_readptr(struct emu10k1_card *, uint32 , uint32 );

void emu10k1_irq_enable(struct emu10k1_card *, uint32);
void emu10k1_irq_disable(struct emu10k1_card *, uint32);
void emu10k1_set_stop_on_loop(struct emu10k1_card *, uint32);
void emu10k1_clear_stop_on_loop(struct emu10k1_card *, uint32);

/* AC97 Codec register access function */
uint16 emu10k1_ac97_read(struct ac97_codec *, uint8);
void emu10k1_ac97_write(struct ac97_codec *, uint8, uint16);

/* MPU access function*/
int emu10k1_mpu_write_data(struct emu10k1_card *, uint8);
int emu10k1_mpu_read_data(struct emu10k1_card *, uint8 *);
int emu10k1_mpu_reset(struct emu10k1_card *);
int emu10k1_mpu_acquire(struct emu10k1_card *);
int emu10k1_mpu_release(struct emu10k1_card *);

#endif  /* _HWACCESS_H */








