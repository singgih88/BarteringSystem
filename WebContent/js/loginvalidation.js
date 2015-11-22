$(document).ready(function() {


	$('#loginform').bootstrapValidator({
       // container: '#messages',
    	framework : 'bootstrap',
    	live: 'enabled',
    	err: {
            container: function($field, validator) {
                // Look at the markup
                //  <div class="col-xs-4">
                //      <field>
                //  </div>
                //  <div class="col-xs-5 messageContainer"></div>
                return $field.parent().next('.messageContainer');
            }
        },
       
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
        	email: {
        		validMessage: 'Email looks great',
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
                        message: 'The email address is not valid'
                    }
                    
                }
            },
        	
        	
        	password: {
                validators: {
                    notEmpty: {
                        message: 'The full name is required and cannot be empty'
                    },
                    stringLength: {
                        enabled: true,
                        min: 8,
                        max: 40,
                        message: 'The full name must be more than 8 and less than 40 characters long'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'The full name can only consist of alphabetical, number, and space'
                    }
                }
            }
            
        }
    })
    	
        $('#signupform').bootstrapValidator({
       // container: '#messages',
    	framework : 'bootstrap',
    	live: 'enabled',
    	err: {
            container: function($field, validator) {
                // Look at the markup
                //  <div class="col-xs-4">
                //      <field>
                //  </div>
                //  <div class="col-xs-5 messageContainer"></div>
                return $field.parent().next('.signupMessageContainer');
            }
        },
       
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
        	email: {
        		
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
                        message: 'The email address is not valid'
                    }
                    
                }
            },
        	
            firstname: {
        		
                validators: {
                    notEmpty: {
                        message: 'The First name is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[A-z]+$/,
                        message: 'The First Name is not valid'
                    }
                    
                }
            },
        	
            lastname: {
        		
                validators: {
                    notEmpty: {
                        message: 'The Last name is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[A-z]+$/,
                        message: 'The Last name is not valid'
                    }
                    
                }
            },
            
           email: {
        		
                validators: {
                    notEmpty: {
                        message: 'The Email is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /\S+@\S+\.\S+/,
                        message: 'The Email is not valid'
                    }
                    
                }
            },
            
phone: {
        		
                validators: {
                    notEmpty: {
                        message: 'The phone number is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/,
                        message: 'The phone number entered is not valid'
                    }
                    
                }
            },
            
            address1: {
        		
                validators: {
                    notEmpty: {
                        message: 'The address is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[A-Za-z0-9'\.\-\s\,]+$/,
                        message: 'do not use special characters'
                    }
                    
                }
            },
            
            address2: {
        		
                validators: {
                    notEmpty: {
                        message: 'The address is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[A-Za-z0-9'\.\-\s\,]+$/,
                        message: 'do not use special characters'
                    }
                    
                }
            },
            
city: {
        		
                validators: {
                    notEmpty: {
                        message: 'The city is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[A-z\s]+$/,
                        message: 'do not use special characters'
                    }
                    
                }
            },
            
zipcode: {
        		
                validators: {
                    notEmpty: {
                        message: 'The zipcode is required and cannot be empty'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /(^\d{5}$)|(^\d{5}-\d{4}$)/,
                        message: 'Enter valid zipcode'
                    }
                    
                }
            },
            passwd: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        enabled: true,
                        min: 8,
                        max: 40,
                        message: 'The password must be more than 8 and less than 40 characters long'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'The password can only consist of alphabetical, number, and space'
                    },
                    
                }
            },
            confirmpassword: {
                validators: {
                	notEmpty: {
                        message: 'The confirm password is required and cannot be empty'
                    },
                    stringLength: {
                        enabled: true,
                        min: 8,
                        max: 40,
                        message: 'The password must be more than 8 and less than 40 characters long'
                    },
                    regexp: {
                        enabled: true,
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'The password can only consist of alphabetical, number, and space'
                    },
                    identical:{
                    	field: 'passwd',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }
        }
    })
    

});

