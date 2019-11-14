/*******************************************************************************
* File Name: OSC_OUT.h  
* Version 2.20
*
* Description:
*  This file contains Pin function prototypes and register defines
*
* Note:
*
********************************************************************************
* Copyright 2008-2015, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
*******************************************************************************/

#if !defined(CY_PINS_OSC_OUT_H) /* Pins OSC_OUT_H */
#define CY_PINS_OSC_OUT_H

#include "cytypes.h"
#include "cyfitter.h"
#include "cypins.h"
#include "OSC_OUT_aliases.h"

/* APIs are not generated for P15[7:6] */
#if !(CY_PSOC5A &&\
	 OSC_OUT__PORT == 15 && ((OSC_OUT__MASK & 0xC0) != 0))


/***************************************
*        Function Prototypes             
***************************************/    

/**
* \addtogroup group_general
* @{
*/
void    OSC_OUT_Write(uint8 value);
void    OSC_OUT_SetDriveMode(uint8 mode);
uint8   OSC_OUT_ReadDataReg(void);
uint8   OSC_OUT_Read(void);
void    OSC_OUT_SetInterruptMode(uint16 position, uint16 mode);
uint8   OSC_OUT_ClearInterrupt(void);
/** @} general */

/***************************************
*           API Constants        
***************************************/
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup driveMode Drive mode constants
     * \brief Constants to be passed as "mode" parameter in the OSC_OUT_SetDriveMode() function.
     *  @{
     */
        #define OSC_OUT_DM_ALG_HIZ         PIN_DM_ALG_HIZ
        #define OSC_OUT_DM_DIG_HIZ         PIN_DM_DIG_HIZ
        #define OSC_OUT_DM_RES_UP          PIN_DM_RES_UP
        #define OSC_OUT_DM_RES_DWN         PIN_DM_RES_DWN
        #define OSC_OUT_DM_OD_LO           PIN_DM_OD_LO
        #define OSC_OUT_DM_OD_HI           PIN_DM_OD_HI
        #define OSC_OUT_DM_STRONG          PIN_DM_STRONG
        #define OSC_OUT_DM_RES_UPDWN       PIN_DM_RES_UPDWN
    /** @} driveMode */
/** @} group_constants */
    
/* Digital Port Constants */
#define OSC_OUT_MASK               OSC_OUT__MASK
#define OSC_OUT_SHIFT              OSC_OUT__SHIFT
#define OSC_OUT_WIDTH              1u

/* Interrupt constants */
#if defined(OSC_OUT__INTSTAT)
/**
* \addtogroup group_constants
* @{
*/
    /** \addtogroup intrMode Interrupt constants
     * \brief Constants to be passed as "mode" parameter in OSC_OUT_SetInterruptMode() function.
     *  @{
     */
        #define OSC_OUT_INTR_NONE      (uint16)(0x0000u)
        #define OSC_OUT_INTR_RISING    (uint16)(0x0001u)
        #define OSC_OUT_INTR_FALLING   (uint16)(0x0002u)
        #define OSC_OUT_INTR_BOTH      (uint16)(0x0003u) 
    /** @} intrMode */
/** @} group_constants */

    #define OSC_OUT_INTR_MASK      (0x01u) 
#endif /* (OSC_OUT__INTSTAT) */


/***************************************
*             Registers        
***************************************/

/* Main Port Registers */
/* Pin State */
#define OSC_OUT_PS                     (* (reg8 *) OSC_OUT__PS)
/* Data Register */
#define OSC_OUT_DR                     (* (reg8 *) OSC_OUT__DR)
/* Port Number */
#define OSC_OUT_PRT_NUM                (* (reg8 *) OSC_OUT__PRT) 
/* Connect to Analog Globals */                                                  
#define OSC_OUT_AG                     (* (reg8 *) OSC_OUT__AG)                       
/* Analog MUX bux enable */
#define OSC_OUT_AMUX                   (* (reg8 *) OSC_OUT__AMUX) 
/* Bidirectional Enable */                                                        
#define OSC_OUT_BIE                    (* (reg8 *) OSC_OUT__BIE)
/* Bit-mask for Aliased Register Access */
#define OSC_OUT_BIT_MASK               (* (reg8 *) OSC_OUT__BIT_MASK)
/* Bypass Enable */
#define OSC_OUT_BYP                    (* (reg8 *) OSC_OUT__BYP)
/* Port wide control signals */                                                   
#define OSC_OUT_CTL                    (* (reg8 *) OSC_OUT__CTL)
/* Drive Modes */
#define OSC_OUT_DM0                    (* (reg8 *) OSC_OUT__DM0) 
#define OSC_OUT_DM1                    (* (reg8 *) OSC_OUT__DM1)
#define OSC_OUT_DM2                    (* (reg8 *) OSC_OUT__DM2) 
/* Input Buffer Disable Override */
#define OSC_OUT_INP_DIS                (* (reg8 *) OSC_OUT__INP_DIS)
/* LCD Common or Segment Drive */
#define OSC_OUT_LCD_COM_SEG            (* (reg8 *) OSC_OUT__LCD_COM_SEG)
/* Enable Segment LCD */
#define OSC_OUT_LCD_EN                 (* (reg8 *) OSC_OUT__LCD_EN)
/* Slew Rate Control */
#define OSC_OUT_SLW                    (* (reg8 *) OSC_OUT__SLW)

/* DSI Port Registers */
/* Global DSI Select Register */
#define OSC_OUT_PRTDSI__CAPS_SEL       (* (reg8 *) OSC_OUT__PRTDSI__CAPS_SEL) 
/* Double Sync Enable */
#define OSC_OUT_PRTDSI__DBL_SYNC_IN    (* (reg8 *) OSC_OUT__PRTDSI__DBL_SYNC_IN) 
/* Output Enable Select Drive Strength */
#define OSC_OUT_PRTDSI__OE_SEL0        (* (reg8 *) OSC_OUT__PRTDSI__OE_SEL0) 
#define OSC_OUT_PRTDSI__OE_SEL1        (* (reg8 *) OSC_OUT__PRTDSI__OE_SEL1) 
/* Port Pin Output Select Registers */
#define OSC_OUT_PRTDSI__OUT_SEL0       (* (reg8 *) OSC_OUT__PRTDSI__OUT_SEL0) 
#define OSC_OUT_PRTDSI__OUT_SEL1       (* (reg8 *) OSC_OUT__PRTDSI__OUT_SEL1) 
/* Sync Output Enable Registers */
#define OSC_OUT_PRTDSI__SYNC_OUT       (* (reg8 *) OSC_OUT__PRTDSI__SYNC_OUT) 

/* SIO registers */
#if defined(OSC_OUT__SIO_CFG)
    #define OSC_OUT_SIO_HYST_EN        (* (reg8 *) OSC_OUT__SIO_HYST_EN)
    #define OSC_OUT_SIO_REG_HIFREQ     (* (reg8 *) OSC_OUT__SIO_REG_HIFREQ)
    #define OSC_OUT_SIO_CFG            (* (reg8 *) OSC_OUT__SIO_CFG)
    #define OSC_OUT_SIO_DIFF           (* (reg8 *) OSC_OUT__SIO_DIFF)
#endif /* (OSC_OUT__SIO_CFG) */

/* Interrupt Registers */
#if defined(OSC_OUT__INTSTAT)
    #define OSC_OUT_INTSTAT            (* (reg8 *) OSC_OUT__INTSTAT)
    #define OSC_OUT_SNAP               (* (reg8 *) OSC_OUT__SNAP)
    
	#define OSC_OUT_0_INTTYPE_REG 		(* (reg8 *) OSC_OUT__0__INTTYPE)
#endif /* (OSC_OUT__INTSTAT) */

#endif /* CY_PSOC5A... */

#endif /*  CY_PINS_OSC_OUT_H */


/* [] END OF FILE */
