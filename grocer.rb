
def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    if new_hash[item.keys[0]]
      new_hash[item.keys[0]][:count] += 1
    else
      new_hash[item.keys[0]] = {
        count: 1,
        price: item.values[0][:price],
        clearance: item.values[0][:clearance]
      }
    end
  end
  new_hash
end


def apply_coupons(cart, coupons)
  
  coupons.each do |coupon|
    
      if cart[coupon[:item]]
        
      item_count_cart = cart[coupon[:item]][:count] / coupon[:num]
      
      if cart[coupon[:item]][:count] >= coupon[:num]
        
        cart[coupon[:item] + " W/COUPON"] = {
          count: coupon[:num] * item_count_cart,
          price: coupon[:cost] / coupon[:num],
          clearance: cart[coupon[:item]][:clearance]
        }
        
        cart[coupon[:item]][:count] -= cart[coupon[:item] + " W/COUPON"][:count]
      end 
    end
  end
    cart
end


def apply_clearance(cart)
  
  cart.each do |item|
    
  if cart[item]
    
    if cart[item][:clearance]=true
      
      cart[item][:price] = (cart[item][:price]* 0.8).round(2)
    end
  end
  end
   
end

def checkout(cart, coupons)
  # code here
end
