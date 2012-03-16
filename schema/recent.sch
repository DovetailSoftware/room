/*************************************************************************
 *
 * Product        :  Recently Opened Objects Monitor
 *                                                                          
 * Name           :  recent.sch
 *                                                                           
 * Description    :  This partial schema file provides information required
 *                   required to update a Clarify schema for the ROOM product.
 *
 *                   In this partial schema file is:
 * 
 *                   * One new field for the USER table
 *                   * One new relation for the USER table
 *                   * One new table: table_recent_objs
 *                   * Two new tables for the internationalization 
 *                        fc_string      
 *                        fc_locale      
 *      
 *                   Use a text editor to cut+paste these changes into
 *                   a current Clarify schema file.
 *
 * Usage          :  * Use the Clarify Data Dictionary Editor to export a schema file
 *                   * Use a text editor to cut+paste these changes into the file
 *                   * Use the Data Dictionary Editor to apply the schema file
 *
 *                   * Any relation that is declared as USER_DEFINED must be located after any other 
 *                   * relations that are defined by Clarify. Both the relation and the inverse relation
 *                   * must have the USER_DEFINED notation, or an error will be reported during the update.
 *
 *                   * All fields and relations MUST be placed at the end of their respective sections for
 *                   * their data objects.
 *
 * Author         :  First Choice Software, Inc.                             
 *                   4412 Spicewood Springs Road Suite 701
 *                   Austin, TX  78759                                       
 *                   (512) 418-2905                                          
 *                                                                           
 * Platforms      :  This version supports Clarify 5.0 and later             
 *                                                                           
 * Copyright (C) 1999 First Choice Software, Inc.                           
 * All Rights Reserved                                                       
 *************************************************************************/

/*
 * Add the following fields to the schema
 */

1) New field for the USER object

,
    x_num_recent_obj  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="Number of recent objects to display"
     
/*
 * Add the following relations to the schema
 */

2) New relations

,
    user2recent_obj OTM recent_obj USER_DEFINED
    INV_REL=recent_obj2user     COMMENT=""

/*
 * Add the following objects to the schema
 */

3) New objects

OBJECT recent_obj 3630
 SUBJECT="Workflow Mgr"
 COMMENT="Recently Accessed objects"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    obj_type  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY USER_DEFINED
     ARRAY_SIZE=30
     COMMENT="Object type (case, bug...)"
,
    obj_objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED
     COMMENT="Objid of object"
,
    rank  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED
     COMMENT="Which number object is it?"
,
    obj_id  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     MANDATORY USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="ID Number of Object"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    recent_obj2user MTO user USER_DEFINED
    INV_REL=user2recent_obj     COMMENT=""

  RELATIONS_END
OBJECT_END;

OBJECT fc_string 3500
 SUBJECT="System"
 COMMENT="Locale-based strings for First Choice Software Customizations"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    id  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="String ID"
,
    string  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
     COMMENT="Text  of the string"
,
    locale  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
     COMMENT="Indicates the locale of the string; e.g., EN_US=US English, JA_JP=Japanese in Japan"
,
    application  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

OBJECT fc_locale 3505
 SUBJECT="System"
 COMMENT=" "
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    locale_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    abday  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    day  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    abmon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    mon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    d_t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    d_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    am_pm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    t_fmt_ampm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    upper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    lower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    space  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    cntrl  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    punct  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    digit  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    xdigit CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    blank  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    toupper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    tolower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    yesexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    noexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255

,
    int_curr_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    currency_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED COMMENT=""
,
    positive_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    negative_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    int_frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED

,
    decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

/*
 * That's it.
 */
