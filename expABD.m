function [ A, B, D ] = expABD( m_arr, k_arr, c_arr, d_t  )
    A = m_arr/(d_t*d_t)+c_arr/(2*d_t);
    B = k_arr-2*m_arr/(d_t*d_t);
    D = m_arr/(d_t*d_t)-c_arr/(2*d_t);
end

